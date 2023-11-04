# Lecture_OpenSW
#! /bin/sh
item=$1
data=$2
user=$3
num=0
echo "--------------------------"
echo "User Name: $(whoami)"
echo "Student Number: 12215529"
echo "[ MENU ]" 
echo "1. Get the data of the movie identified by a specific 'movie id' from 'u.item'"
echo "2. Get the data of action genre movies from 'u.item'"
echo "3. Get the average 'rating' of the movie identified by specific 'movie id' from 'u.data'"
echo "4. Delete the 'IMDb URL' from 'u.item'"
echo "5. Get the data about users from 'u.user'"
echo "6. Modify the format of 'release data' in 'u.item'"
echo "7. Get the data of movies rated by a specific 'user id' from 'u.data'"
echo "8. Get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'"
echo "9. Exit"
echo '--------------------------'
while :
do
   read -p  "Enter your choice [ 1-9 ] " num
   case $num in
      1)
      echo
      fir=0
      read -p "Please enter 'movie id'(1~1682) : " fir
      echo  
      cat $item | sed -n "${fir}p"
      echo
      ;;
      2)
      echo
      ans=0
      read -p "Do you want to get the data of 'action' genre movies from 'u.item'?(y/n):" ans
      echo
      if [ ${ans} = 'y' ]; then
         awk -F'|' '$7 == 1 {print  $1, $2; count++; if(count == 10) exit}' $item
      fi
      echo
      ;;
