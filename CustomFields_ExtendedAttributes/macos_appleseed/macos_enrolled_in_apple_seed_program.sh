#!/bin/bash

macos_enrolled_in_apple_seed_program=$( /System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil current | awk '/enrolled/{print $NF}' )

echo "$macos_enrolled_in_apple_seed_program"

exit 0