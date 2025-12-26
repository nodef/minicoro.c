#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -d "minicoro" ]; then return; fi
URL="https://github.com/edubart/minicoro/raw/refs/heads/main/minicoro.h"
FILE="minicoro.h"

# Download the release
mkdir -p minicoro
echo "Downloading $FILE from $URL ..."
curl -L "$URL" -o "minicoro/$FILE"
echo ""
}


# Test the project
test() {
echo "Running 01-simple.c ..."
clang -I. -o 01.exe examples/01-simple.c     && ./01.exe && echo -e "\n"
echo "Running 02-fibonacci.c ..."
clang -I. -o 02.exe examples/02-fibonacci.c  && ./02.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
