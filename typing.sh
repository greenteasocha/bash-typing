#!/usr/bin/bash
set -eu

# create target word list from file
# words=("The" "quick" "brown" "fox" "jumps" "over" "the" "lazy" "dog")
searched_index=0
words_size=${1:-10}
words=()
input_file=${2:-"words.txt"}
while read line
do 
    if [ ${searched_index} -lt ${words_size} ]; 
    then
        # initialize array
        words+=( $line )
    else
        # Reservoir Sampling
        random=$((${RANDOM} % ${searched_index}))
        if [ ${random} -lt ${words_size} ];
        then
            words[$random]=$line
            
        fi
    fi
    searched_index=$(($searched_index + 1))
    
done < ${input_file}

# --- sampling debug ---
# for word in ${words[@]}; do
#     echo $word
# done
# exit 

# execute simple typing game with read words list
all=0
collect=0

for word in ${words[@]}; do
    printf '\e[m\e[0J%s\n' $word
    
    read str

    sleep 0.1

    if [ "$str" == "$word" ];
    then
        printf '\e[1F\e[0J\e[44m%s\n\e[2F' $str
        collect=$(($collect + 1))
    else
        printf '\e[1F\e[0J\e[41m%s\n\e[2F' $str
    fi
    all=$(($all + 1))

    sleep 0.3
done

printf '\e[m\e[0J'
printf 'Result: %s/%s\n' $collect $all