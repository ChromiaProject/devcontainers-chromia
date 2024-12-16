#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "psql" sleep 2 && psql postchain -c "\\dt"
check "chr" chr --version
check "profile" cat ~/.profile
check "completions" source ~/.profile && complete -p chr
check "bun" bun -v
check "pnpm" pnpm -v
check "yarn" yarn -v
check "pmc alias" alias pmc
check "pmc" pmc --version

# Report result
reportResults
