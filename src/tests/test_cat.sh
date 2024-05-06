#!bin/bash

FUNC_SUCCESS=0
FUNC_FAIL=0
COUNTER=0
DIFF=""

declare -x file="$(find $(pwd) -name s21_cattest1.txt)"

cd ../C3_SimpleBashUtils-0/src/cat

declare -a flags=(
"b"
"e"
"n"
"s"
"t"
"v"
)

function testing()
{
    str="$options $file"
    ./s21_cat $str > s21_cat_testing.log
    cat $str > system_cat_testing.log
    DIFF="$(diff -s s21_cat_testing.log system_cat_testing.log)"
    (( COUNTER++ ))
    if [ "$DIFF" == "Files s21_cat_testing.log and system_cat_testing.log are identical" ]
    then
        (( FUNC_SUCCESS++ ))
        echo "cat $str FUNCTIONALITY SUCCESS $FUNC_FAIL|$FUNC_SUCCESS"
    else
        (( FUNC_FAIL++ ))
        echo "cat $str FUNCTIONALITY FAIL $FUNC_FAIL|$FUNC_SUCCESS"
    fi
    rm s21_cat_testing.log system_cat_testing.log
}

for opt1 in "${flags[@]}"
do
    for opt2 in "${flags[@]}"
    do
        for opt3 in "${flags[@]}"
        do
            for opt4 in "${flags[@]}"
            do
                if [ $opt1 != $opt2 ] && [ $opt1 != $opt3 ] \
                && [ $opt1 != $opt4 ] && [ $opt2 != $opt3 ] \
                && [ $opt2 != $opt4 ] && [ $opt3 != $opt4 ]
                then
                    options="-$opt1$opt2$opt3$opt4"
                    testing
                fi
            done
        done
    done
done

echo "FAIL: $FUNC_FAIL"
echo "SUCCESS: $FUNC_SUCCESS"
echo "ALL: $COUNTER"
