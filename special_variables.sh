#!bin/bash

echo "special variables are :"
echo "all variable passed to script :$@"
echo "number of variables passed to the script:$#"
echo "script name :$0"
echo "for present working directory:$PWD"
echo "who is running th script:$USER"
echo "home folder $Home"
echo "background procee id : $!"
echo "PID for the script : $$"
echo "exit status code of previous command : $?"