# bash-typing
simple typing game  
my practice of ANSI escape code

## usage
```
# bash typing.sh [num_target_words] [words_list_file]
# exapmle
bash typing.sh 10 words.txt
```

![2022-01-05-00-11-16](https://user-images.githubusercontent.com/37926549/148641070-9eccd1a7-022d-4e33-ba4c-87d1194af9b3.gif)

## supplementary links
Reservoir sampling  
https://en.wikipedia.org/wiki/Reservoir_sampling

sample word lists is extracted from:  
https://www.espressoenglish.net/100-common-nouns-in-english/


## TODO
- restrict num_target_words to be under 32767(upper bound of $RANDOM)
- abort Reservoir sampling if input file is too large
