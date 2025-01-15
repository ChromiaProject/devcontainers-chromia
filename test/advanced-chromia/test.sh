#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "psql" sleep 2 && psql -c "\\dt"
check "chr" chr --version
check "pmc" pmc --version
check "ethereum" sleep 2 & curl -X POST -H "Content-Type: application/json" \
    --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}' \
    http://$ETH_RPC_URL:8545

# Report result
reportResults
