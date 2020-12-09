cmd=$(hostname)
file=$(head -n 1 /etc/Talha/talha_pass.txt)
size=$(stat -c %s /etc/Talha/talha_pass.txt)
files=/etc/Talha/talha_pass.txt
if test -f $files
then
	echo ""
        echo "File is present. Lets Starts!"
else
        touch /etc/Talha/talha_pass.txt
fi

echo "#######################################################################"
echo "                   Enter a Choice# from below"
echo "#######################################################################"
echo "1. Single User Authentication"
echo "2. Multi-Password User Authentication"
echo "3. Exit"
read choice
if test $choice = 1
then
	#echo "1"
	echo "Enter Username : "
        read username
        echo "Enter password : "
        read password
        user=$(grep $username Talha/talha_user.txt)
        if [[ $? -eq 0 ]]
        then
                check=$(grep $username Talha/talha_user.txt | cut -f2 -d:)
                if test "$check" = "S"
                then
                        lineNo=$(grep -n $username Talha/talha_user.txt | cut -f1 -d:)
                        ((lineNo++))
                        passwd=$(head -n $line Talha/talha_user.txt | tail -n 1)
                        if test $password = "$passwd"
                        then
                                echo "Success"
                        else
                                echo "Incorrect Username or Password. Please Try Again!"
                        fi

                else
                       echo "Error. Please Try Again!"
                fi
        else
                echo "No Records Found"
	fi
elif test $choice = 2
then
	#echo "2"
	echo "Input Username : "
        read username
        echo "Enter password : "
        read password
        user=$(grep $username /etc/Talha/talha_user.txt)
        if [[ $? -eq 0 ]]
        then
                check=$(grep $username /etc/Talha/talha_user.txt | cut -f2 -d:)
                if test "$check" = "M"
                then
                        lineNo=$(grep -n $username /etc/Talha/talha_user.txt | cut -f1 -d:)
                        passwd=$(head -n $line /etc/Talha/talha_user.txt | tail -n 1)
                        ((line++))
                        sndpswd=$(head -n $line /etc/Talha/talha.txt | tail -n 1)
                        if test $password = "$passwd" || test $password = "$sndpswd"
                        then
                                echo "Success"
                        else
                                echo "Incorrect Username or Password"
                        fi
                else
        		echo "Error. Please Try again!"
                fi
        else
                echo "No Record Found!"
        fi

elif test $choice = 3
then
	echo "Bye!"
	exit 1
else
	echo "Error! Please try again"
fi
