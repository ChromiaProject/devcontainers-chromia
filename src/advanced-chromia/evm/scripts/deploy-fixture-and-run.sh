#!/bin/bash

# Exit script on error
set -e

env

# Launch anvil in the background
anvil --host 0.0.0.0 &
sleep 2

# Step 1: Compile the contract
echo "Compiling contract..."
forge build /app/evm/contracts/

# Step 2: Deploy the contract
echo "Deploying contract..."
DEPLOYED_ADDRESS=$(cast send --value 0 --private-key $RAW_PRIVATE_KEY --json --create $(forge inspect $CONTRACT_PATH bytecode) "constructor(uint256)" "42" | sed -e 's/^.*"contractAddress":"\([^"]*\)".*$/\1/' );

echo "Contract deployed at address: '$DEPLOYED_ADDRESS'"

# Step 3: Verify deployment
echo "Verifying deployment..."
cast call $DEPLOYED_ADDRESS "balanceOf(address owner) (uint256)" $DEPLOYED_ADDRESS

# Step 4: Build a bridge
apk add nodejs npm
npm install -g yarn cross-env
cd /app/evm/libs/postchain-eif/postchain-eif-contracts
yarn install
yarn compile
yarn deploy --network localhost --app $CHR_DEFAULT_NODE_ADDRESS --offset 2

yarn allowToken:bridge --network localhost --bridge-address $EVM_BRIDGE_ADDRESS --token-address $CHR_DEFAULT_NODE_ADDRESS

sleep infinity
