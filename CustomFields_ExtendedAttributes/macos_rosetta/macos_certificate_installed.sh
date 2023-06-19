#!/bin/sh

# REFERENCE: https://mostlymac.blog/2022/01/13/detecting-if-rosetta-2-is-installed-on-an-apple-silicon-mac/

# If cpu is Apple branded, use arch binary to check if x86_64 code can run
if [[ "$(sysctl -n machdep.cpu.brand_string)" == *'Apple'* ]]; then
    if arch -x86_64 /usr/bin/true 2> /dev/null; then
        result="Installed"
    else
        result="Missing"
    fi
else
    result="Ineligible"
fi

echo "$result"
