#!/bin/bash
#
# Find prime numbers from 1 - 100
#

# isPrimeNumber function
function isPrimeNumber() {
  if [ -z "$1" ]
  then
    echo "-Please pass in an integer"
  fi

  variable=$1
  #echo "variable="$variable
  
  i=2
  valHalf=$(($variable/$i))

  mulipliers=()  

  while [ $i -le $valHalf ]
  do
    #echo $i
    if [ $(($variable%$i)) == 0 ]; then
      echo '$i='$i >&2
      return 00
    else
      if [ $i -eq 2 ]; then
        i=$(($i+1))
      else
        i=$(($i+2))
      fi
      valHalf=$(($variable/$i))
    fi
  done 
  return 1
}


primeNums=(2)

for n in `seq 3 100`
do
  #echo 'n='$n
  
  # This is one of the valid ways
  #flag=0
  #for i in "${primeNums[@]}"
  #do
    ##echo -e 'i='$i'\tn='$n'\t$n%$i='$(($n%$i))
    #if [ $(($n%$i)) == 0 ]; then
      #flag=1
      ##echo 'flag is set '$flag
      #continue
    #fi
  #done
  ##echo 'flag='$flag
  #if [ $flag == 0 ]; then
    #primeNums+=($n)
  #fi
  
  # This is another way
  $(isPrimeNumber $n)
  if [ $? -eq 1 ]; then
    primeNums+=($n)
  fi
done
printf '%s\n' "${primeNums[@]}"

$(isPrimeNumber 15)
echo '$retval='$?
