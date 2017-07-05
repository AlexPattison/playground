#!/bin/bash

set -eu

# set proj equal to current directory?
# when I try evaluating the assignment in the console I end up with "dirname path"
proj=$(dirname "$0")/..
# cd into proj
cd "$proj"

# remove existing cjs before repopulating
rm -rf cjs

# print to console
echo "Compiling to CommonJS..."

# loop through (not sure quite what)
for f in $(find src -name "*.js")
do
    in=$f
    out=${f/src/cjs}
    # make each of the CommonJS directories
    mkdir -p $(dirname $out)
    echo "  $in > $out"
    node_modules/.bin/babel $in > $out
done

echo
