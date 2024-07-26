#!/bin/bash

Access_Log=/var/log/apache2/access.log
Error_Log=/var/log/apache2/error.log

# Most active IP addresses
echo  "Most Active IP Addresses:"
awk '{print $1}' "$Access_Log" | sort | uniq -c | sort -nr | head -n 10


# Most requested pages
echo  "Most Requested Pages:"
awk '{print $7}' "$Access_Log" | sort | uniq -c | sort -nr | head -n 10

# Number of 404 errors
echo "Number of 404 errors:"
grep '" 404 ' "$Error_Log" | wc -l