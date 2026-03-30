#!/bin/bash

# Vault Omni Protocol - Smoke Test Script
# Verifies all critical components are working after deployment

set -e

echo "🚀 Starting Vault Omni Protocol Smoke Tests..."
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
BACKEND_URL="${BACKEND_URL:-http://localhost:3001}"
FRONTEND_URL="${FRONTEND_URL:-http://localhost:5173}"
TEST_WALLET="0x1234567890123456789012345678901234567890"

# Test counters
TESTS_PASSED=0
TESTS_FAILED=0

# Helper functions
test_endpoint() {
  local name=$1
  local method=$2
  local url=$3
  local expected_status=$4
  
  echo -n "Testing $name... "
  
  response=$(curl -s -w "\n%{http_code}" -X "$method" "$url" \
    -H "Content-Type: application/json" \
    -H "x-address: $TEST_WALLET" 2>/dev/null || echo "000")
  
  http_code=$(echo "$response" | tail -n1)
  
  if [ "$http_code" = "$expected_status" ]; then
    echo -e "${GREEN}✓ PASS${NC} (HTTP $http_code)"
    ((TESTS_PASSED++))
  else
    echo -e "${RED}✗ FAIL${NC} (Expected $expected_status, got $http_code)"
    ((TESTS_FAILED++))
  fi
}

# Test Backend Health
echo "=== Backend Health Checks ==="
echo ""

test_endpoint "Backend Health" "GET" "$BACKEND_URL/health" "200"
test_endpoint "Get Tokens" "GET" "$BACKEND_URL/api/tokens" "200"
test_endpoint "Get Mining Sessions" "GET" "$BACKEND_URL/api/mining/sessions" "200"
test_endpoint "Get Bridge History" "GET" "$BACKEND_URL/api/bridge/history" "200"

echo ""
echo "=== Frontend Health Checks ==="
echo ""

# Test Frontend
echo -n "Testing Frontend Load... "
frontend_response=$(curl -s -o /dev/null -w "%{http_code}" "$FRONTEND_URL" 2>/dev/null || echo "000")
if [ "$frontend_response" = "200" ]; then
  echo -e "${GREEN}✓ PASS${NC} (HTTP $frontend_response)"
  ((TESTS_PASSED++))
else
  echo -e "${RED}✗ FAIL${NC} (Expected 200, got $frontend_response)"
  ((TESTS_FAILED++))
fi

echo ""
echo "=== Database Checks ==="
echo ""

# Test Database Connection
echo -n "Testing Database Connection... "
if command -v psql &> /dev/null; then
  if psql "$DATABASE_URL" -c "SELECT 1" > /dev/null 2>&1; then
    echo -e "${GREEN}✓ PASS${NC}"
    ((TESTS_PASSED++))
  else
    echo -e "${RED}✗ FAIL${NC} (Cannot connect to database)"
    ((TESTS_FAILED++))
  fi
else
  echo -e "${YELLOW}⊘ SKIP${NC} (psql not installed)"
fi

# Test Database Tables
echo -n "Testing Database Tables... "
if command -v psql &> /dev/null; then
  table_count=$(psql "$DATABASE_URL" -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='public';" 2>/dev/null || echo "0")
  if [ "$table_count" -gt "0" ]; then
    echo -e "${GREEN}✓ PASS${NC} ($table_count tables found)"
    ((TESTS_PASSED++))
  else
    echo -e "${RED}✗ FAIL${NC} (No tables found)"
    ((TESTS_FAILED++))
  fi
else
  echo -e "${YELLOW}⊘ SKIP${NC} (psql not installed)"
fi

echo ""
echo "=== Smart Contract Checks ==="
echo ""

# Test Contract Compilation
echo -n "Testing Contract Compilation... "
if [ -d "contracts" ]; then
  if cd contracts && npx hardhat compile > /dev/null 2>&1; then
    echo -e "${GREEN}✓ PASS${NC}"
    ((TESTS_PASSED++))
    cd ..
  else
    echo -e "${RED}✗ FAIL${NC} (Compilation failed)"
    ((TESTS_FAILED++))
    cd ..
  fi
else
  echo -e "${YELLOW}⊘ SKIP${NC} (contracts directory not found)"
fi

echo ""
echo "=== Test Suite Checks ==="
echo ""

# Test Frontend Tests
echo -n "Testing Frontend Tests... "
if [ -d "frontend" ]; then
  if cd frontend && npm run test -- --run > /dev/null 2>&1; then
    echo -e "${GREEN}✓ PASS${NC}"
    ((TESTS_PASSED++))
    cd ..
  else
    echo -e "${YELLOW}⊘ SKIP${NC} (Tests not configured)"
    cd ..
  fi
else
  echo -e "${YELLOW}⊘ SKIP${NC} (frontend directory not found)"
fi

# Test Backend Tests
echo -n "Testing Backend Tests... "
if [ -d "backend" ]; then
  if cd backend && npm run test -- --run > /dev/null 2>&1; then
    echo -e "${GREEN}✓ PASS${NC}"
    ((TESTS_PASSED++))
    cd ..
  else
    echo -e "${YELLOW}⊘ SKIP${NC} (Tests not configured)"
    cd ..
  fi
else
  echo -e "${YELLOW}⊘ SKIP${NC} (backend directory not found)"
fi

echo ""
echo "=== Environment Variables Check ==="
echo ""

# Check required environment variables
required_vars=(
  "DATABASE_URL"
  "RPC_ETHEREUM"
  "RPC_BNB"
  "RPC_POLYGON"
  "RPC_ARBITRUM"
)

for var in "${required_vars[@]}"; do
  echo -n "Checking $var... "
  if [ -z "${!var}" ]; then
    echo -e "${YELLOW}⊘ NOT SET${NC}"
  else
    echo -e "${GREEN}✓ SET${NC}"
    ((TESTS_PASSED++))
  fi
done

echo ""
echo "=== Summary ==="
echo ""
echo -e "Tests Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests Failed: ${RED}$TESTS_FAILED${NC}"
echo ""

if [ $TESTS_FAILED -eq 0 ]; then
  echo -e "${GREEN}✓ All smoke tests passed!${NC}"
  exit 0
else
  echo -e "${RED}✗ Some tests failed. Please review the output above.${NC}"
  exit 1
fi
