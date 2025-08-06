#!/bin/bash

# --- Configuration ---
# Your backend API's base URL
API_URL="http://localhost:3000/api"

# Test user credentials (must exist in your database)
EMAIL="testuser@example.com"
PASSWORD="securepassword123"

# --- Functions ---

# Function to log in and get a JWT token
login_and_get_token() {
  echo "--- Step 1: Logging in to get JWT token ---"
  
  LOGIN_RESPONSE=$(curl -s -X POST "$API_URL/auth/login" \
  -H "Content-Type: application/json" \
  -d "{\"email\": \"$EMAIL\", \"password\": \"$PASSWORD\"}")

  if [ -z "$LOGIN_RESPONSE" ]; then
    echo "Login request failed: no response from server. ❌"
    return 1
  fi

  TOKEN=$(echo "$LOGIN_RESPONSE" | jq -r '.token')

  if [ "$TOKEN" != "null" ]; then
    echo "Login successful. JWT token generated. ✅"
    echo "-----------------------------------"
    echo "$TOKEN"
    return 0
  else
    echo "Login failed. Invalid credentials or server error. ❌"
    echo "Full response: $LOGIN_RESPONSE"
    return 1
  fi
}

# Function to add a buy transaction
add_buy_transaction() {
  local JWT_TOKEN=$1
  echo "--- Step 2: Adding a Buy transaction ---"

  BUY_RESPONSE=$(curl -s -X POST "$API_URL/transactions/add" \
  -H "Authorization: Bearer $JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "ticker": "AAPL",
    "quantity": 5,
    "price": 185.50,
    "transaction_type": "Buy",
    "transaction_date": "2024-07-25T10:00:00Z"
  }')
  
  if [ -z "$BUY_RESPONSE" ]; then
    echo "Buy transaction failed: no response from server. ❌"
    return 1
  fi

  STATUS=$(echo "$BUY_RESPONSE" | jq -r '.message')
  if [ "$STATUS" == "Transaction added successfully" ]; then
    echo "Buy transaction successful. ✅"
    echo "Full response: $BUY_RESPONSE" | jq '.'
    return 0
  else
    echo "Buy transaction failed. ❌"
    echo "Full response: $BUY_RESPONSE" | jq '.'
    return 1
  fi
}

# Function to add a sell transaction
add_sell_transaction() {
  local JWT_TOKEN=$1
  echo "--- Step 3: Adding a Sell transaction ---"

  SELL_RESPONSE=$(curl -s -X POST "$API_URL/transactions/add" \
  -H "Authorization: Bearer $JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "ticker": "AAPL",
    "quantity": 2,
    "price": 190.25,
    "transaction_type": "Sell",
    "transaction_date": "2024-07-26T12:00:00Z"
  }')

  if [ -z "$SELL_RESPONSE" ]; then
    echo "Sell transaction failed: no response from server. ❌"
    return 1
  fi

  STATUS=$(echo "$SELL_RESPONSE" | jq -r '.message')
  if [ "$STATUS" == "Transaction added successfully" ]; then
    echo "Sell transaction successful. ✅"
    echo "Full response: $SELL_RESPONSE" | jq '.'
    return 0
  else
    echo "Sell transaction failed. ❌"
    echo "Full response: $SELL_RESPONSE" | jq '.'
    return 1
  fi
}

# --- Main Script Execution ---

# 1. Get the token from the login function
JWT_TOKEN=$(login_and_get_token)
LOGIN_EXIT_CODE=$?

if [ $LOGIN_EXIT_CODE -eq 0 ]; then
  # 2. Add a buy transaction
  add_buy_transaction "$JWT_TOKEN"
  
  # 3. Add a sell transaction
  add_sell_transaction "$JWT_TOKEN"
else
  echo "Aborting test due to login failure. ❌"
fi