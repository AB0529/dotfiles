#!/bin/bash

adjs=~/Scripts/adjectives.txt
nouns=~/Scripts/nouns.txt
rand_numb=$(shuf -i 1-1000 -n 1)

# process arguments for "starts_with" variables
counter=1
while [[ -n $1 ]]; do
    # only accept single letter (a-z) arguments
    if [[ $1 =~ ^[a-zA-Z]$ ]]; then
        eval starts_with_$counter="$1"
        counter=$[counter + 1]
    fi
    shift
done

# if starts_with_1 has a value and starts_with_2 doesn't, duplicate
[[ -z $starts_with_2 && -n $starts_with_1 ]] && starts_with_2=$starts_with_1

# if shuf is installed...
if [[ $(which shuf) ]]; then
    # grep for starts_with value and pick random result
    # if starts_with is empty, grep will return all entries
    adj=`grep --color=never -e "^$starts_with_1" $adjs | shuf -n 1`
    noun=`grep --color=never -e "^$starts_with_2" $nouns | shuf -n 1`
    # concatenate adjective and noun
    title=`echo ${adj}-${noun}`
fi

echo $title-$rand_numb
