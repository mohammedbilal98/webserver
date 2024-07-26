URL="http://54.161.107.143:80"   
EXPECTED_STATUS=200

status=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
echo $status

if [ "$status" -eq "$EXPECTED_STATUS" ]; then
    echo "Application is up and running."
    exit 0
else
    echo "Application is down or not responding. Status code: $status"
    exit 1
fi