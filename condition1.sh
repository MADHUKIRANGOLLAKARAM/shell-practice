userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo "you are not in root user environment.."
    exit 1
fi

echo "dnf install nginx -y"
echo "installing nginx...."

if [ $? -eq 0 ]; then
    echo "nginx installed successfully.."
else
    echo "nginx installation is failed.."
fi