#!bin/bash

res=$(clang-format -n C3_SimpleBashUtils-0/src/*/*.c C3_SimpleBashUtils-0/src/*/*.h -style=google 2>&1)

if [[ $res ]]; then
	echo $res
	exit 1
fi
