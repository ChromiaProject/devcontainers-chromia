#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "psql" sleep 2 && psql postchain -c "\\dt"
check "chr" chr --version
check "pmc" pmc --version
check "profile" cat ~/.profile
check "completions" source ~/.profile && complete -p chr

# Report result
reportResults
