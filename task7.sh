mysqldump sys > sys_dump.sql
file=$(cat sys_dump.sql)
echo "$file" | sendemail -f talhaawan70@gmail.com -t mtahseensheikh@yahoo.com -s smtp.gmail.com:587 -xu talhaawan70 -xp samsunga719
