userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo "you are not in root user environment.."
    exit 1
fi