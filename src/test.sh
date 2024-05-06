#!/bin/bash

cd tests/

res="$(bash test_cat.sh | grep 'FAIL: 0')"

if [ -z "$res" ]; then
	echo "Tests failed."
	exit 1
fi

res="$(bash test_grep.sh | grep 'FAIL: 0')"

if [ -z "$res" ]; then
        echo "Tests failed."
        exit 1
fi

echo "Tests passed"
