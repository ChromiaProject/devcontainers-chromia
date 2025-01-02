#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "psql" psql -c "\\dt"
check "chr" chr --version
check "pmc" pmc --version

# Report result
reportResults
