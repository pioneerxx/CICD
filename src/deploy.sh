#!/bin/bash

scp ./C3_SimpleBashUtils-0/src/cat/s21_cat danyellt@172.24.116.8:/usr/local/bin
errorCode=$?
if ! [ $errorCode = 0 ]; then
	exit 1
fi

scp ./C3_SimpleBashUtils-0/src/grep/s21_grep danyellt@172.24.116.8:/usr/local/bin
errorcode=$?
if ! [ $errorcode = 0 ]; then
	exit 1
fi
