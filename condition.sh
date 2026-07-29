num=$1
if [ $num -gt 18 ]; then
   echo "you are eligible to vote"
elif [ $num -eq 18 ]; then
   echo "you have some more time to vote"
else
    echo "you are not eligible to vote..."
fi
echo "$#"