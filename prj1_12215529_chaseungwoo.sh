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
      3)
      echo
      thr=0
      total_sum=0
      count=0
      num_round1=0
      num_round2=0
      num_round3=0
      average=0
      read -p "Please enter the 'movie id'(1~1682) : " thr
      echo
      while read -r num1 num2 num3 num4; do
         if [ "$num2" -eq "$thr" ]; then
            total_sum=$((total_sum + num3))
            count=$((count + 1))
         fi
      done < "$data"
      if [ $count -gt 0 ]; then
         num_round1=$(echo "scale=6; $total_sum / $count" | bc)
         num_round2=$(echo "scale=5; $total_sum / $count" | bc)
         num_round3=$(echo "scale=0; ($num_round1*1000000 - $num_round2*1000000)" | bc)
         num_round3=$(echo "$num_round3 / 1" | bc)
         if [ $num_round3 -gt 4 ]; then
            average=$(echo "scale=5; ($num_round1*1000000.0 + 10.0) / 1000000.0" | bc)
         else
            average=$(printf "%.0f" $num_round2) 
         fi 
      fi
      echo "average rating of $thr : $average"
      echo
      ;;
      4)
      echo
      ans=0
      read -p "Do you want to delete the 'IMDb URL' from 'u.item'?(y/n):" ans
      echo
      if [ ${ans} = 'y' ]; then
         head -n 10 "$item" | sed -E 's/http([^|]*|)//'
      fi
      echo
      ;; 
      5)
      echo
      ans=0
      read -p "Do you want to get the data about users from 'u.user'?(y/n):" ans
      echo
      if [ ${ans} = 'y' ]; then
         head -n 10 $user | awk -F'|' '{print "user",$1,"is",$2,"years old",($3 == "M" ? "male" : "female"),$4}'
      fi
      echo
      ;;
      6)
      echo
      ans=0
      read -p "Do you want to Modify the format of 'release data' in 'u.item'?(y/n):" ans
      echo
      if [ ${ans} = 'y' ]; then
        count=1673
        end=1682
        date=0
        year=0
        month=0
        day=0
        new_date=0
        while [ "$count" -le "$end" ]; do
           line=$(awk -v line="$count" 'NR==line' "$item")
           date=$(awk -v line="$count" 'NR==line' "$item" | awk -F '|' '{print $3}')
           day=$(echo "$date" | cut -d'-' -f1)
           month=$(echo "$date" | cut -d'-' -f2)
           year=$(echo "$date" | cut -d'-' -f3)

           case "$month" in
              Jan)
                 new_date="${year}01${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Feb)
                 new_date="${year}02${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Mar)
                 new_date="${year}03${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Apr)
                 new_date="${year}04${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              May)
                 new_date="${year}05${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Jun)
                 new_date="${year}06${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Jul)
                 new_date="${year}07${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Aug)
                 new_date="${year}08${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Sep)
                 new_date="${year}09${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Oct)
                 new_date="${year}10${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Nov)
                 new_date="${year}11${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
              Dec)
                 new_date="${year}12${day}"
                 new_date_1=$(echo "$line" | sed -E "s/\|$day([^|]*$year\|)/\|$new_date\|/")
                 echo $new_date_1
                 ;;
           esac
           count=$((count + 1))
      done
      fi
      echo
      ;;
      7)
      echo
      item=$1
      data=$2
      id=0
      num=0
      read -p "Please enter the 'user id'(1~943):" id
      echo
      awk -F' ' '$1 == '"$id"' {print $2}' "$data" | sort -n | tr '\n' '|' | sed 's/.$//'
      num=$(awk -F' ' '$1 == '"$id"' {print $2}' "$data" | sort -n | head -n 10)

      echo
      echo

      numbers=($num)

      for number in "${numbers[@]}"; do
         movie_name=$(awk -v num="$number" -F'|' '$1 == num { print $2}' "$item")
         echo "$number | $movie_name"
      done
      echo
      ;;
      8)
      echo
      ans=0
      read -p "Do you want to get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'?(y/n):" ans 
      if [ ${ans} = 'y' ]; then
         num=$(awk -F'|' '$2 >= 20 && $2 <= 29 && $4 == "programmer" {print $1}' "$user")

         new_data=""
         for number in $num; do
            new_row=$(awk -F' ' -v num="$number" '$1 == num {print $2, $3}' "$data")
            new_data+="$new_row"$'\n'
         done

         new_data=$(echo "$new_data" | awk NF)

         awk -v new_data="$new_data" 'BEGIN {
            split(new_data, rows, "\n");
            for (i in rows) {
               split(rows[i], cols, " ");
               sum[cols[1]] += cols[2];
               count[cols[1]]++;
            }
            for (key in sum) {
               if (count[key] == 0) {
                  average = 0;
               } else {
                 average = sprintf("%.5f", sum[key] / count[key]);
                 sub("\\.?0+$", "", average);
               }
               printf "%s %s\n", key, average;
            }
         }' | sort -n -k1
      fi
      echo
      ;;
      9)
      echo "Bye!"
      echo
      exit  
      ;;
   esac
done 
