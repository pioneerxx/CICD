#!/bin/bash

cd C3_SimpleBashUtils-0/src/cat/
make s21_cat
if ! [ -f s21_cat ]; then
	echo "s21_cat build failed"
	exit 1
fi

cd ../grep/
make s21_grep
if ! [ -f s21_grep ]; then
        echo "s21_grep build failed"
        exit 1
fi
