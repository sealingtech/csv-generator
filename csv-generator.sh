#!/bin/bash

if [ $# -ne 1 ]
then
echo "Please specify how many lines of CSV would you like to generate !" 1>&2
echo "example: ./random-csv-generator 3" 1>&2
echo "This will generate a random CSV with 3 columns." 1>&2
exit 0
fi

# Constants
X=0

# /usr/share/dict requires `sudo apt install wamerican`
word_list=/usr/share/dict/words

# total number lines in word list
num_lines=$(wc -l $word_list | cut -d ' ' -f 1)



# while loop to generate random words
# number of random generated words depends on supplied argument
while [ "$X" -lt "$1" ]
do
  SKU=$(shuf -i 1000000-1999999 -n 1)
  QUAN=$(shuf -i 0-199 -n 1)
  NM=$(shuf -i 1000-$num_lines -n 1)
  WORD=$(grep -hn . ${word_list} | grep -e "^${NM}:" | cut -d ':' -f 2 | tr -d "'" | tr [:upper:] [:lower:])
  echo "${SKU},${QUAN},${WORD}"
  ((X=$X+1))
done