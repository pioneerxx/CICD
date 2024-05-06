#!bin/bash

FUNC_SUCCESS=0
FUNC_FAIL=0
COUNTER=0
DIFF=""

declare -x file=$(find $(pwd) -name s21_greptest1.txt)

cd ../C3_SimpleBashUtils-0/src/grep/

declare -a flags=(
"-i"
"-c"
"-n"
"-h"
"-s"
"-o"
)

function testing()
{
    str="$options for $file"
    ./s21_grep $str > s21_grep_testing.log
    grep $str > system_grep_testing.log
    DIFF="$(diff -s s21_grep_testing.log system_grep_testing.log)"
    (( COUNTER++ ))
    if [ "$DIFF" == "Files s21_grep_testing.log and system_grep_testing.log are identical" ]
    then
        (( FUNC_SUCCESS++ ))
        echo "grep $str FUNCTIONALITY SUCCESS $FUNC_FAIL|$FUNC_SUCCESS|$COUNTER"
    else
        (( FUNC_FAIL++ ))
        echo "grep $str FUNCTIONALITY FAIL $FUNC_FAIL|$FUNC_SUCCESS|$COUNTER"
    fi
    rm s21_grep_testing.log system_grep_testing.log
}

for opt1 in "${flags[@]}"
do
    for opt2 in "${flags[@]}"
    do
        for opt3 in "${flags[@]}"
        do
            if [ $opt1 != $opt2 ] && [ $opt1 != $opt3 ] && [ $opt2 != $opt3 ]
            then
                options="$opt1 $opt2 $opt3"
                testing
            fi
        done
    done
done

echo "FAIL: $FUNC_FAIL"
echo "SUCCESS: $FUNC_SUCCESS"
echo "ALL: $COUNTER"

