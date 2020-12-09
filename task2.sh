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

echo ""
echo "Please enter your hostname: "
read input
if test $cmd = $input
then
	if test $size = "0"
	then
		echo ""
		echo "Enter Password: "
		read pass
		echo $pass > /etc/Talha/talha_pass.txt
		echo ""
		echo "Password Registered Successfully!"
	else
		echo ""
		echo "Enter Password: "
		read pass
		if test $pass = $file
		then
			echo ""
			echo "Success! Logged In as Muhammad-Talha-VM"
			echo ""
			echo "############################################################################"
			echo ""
			echo "Input new user name to be created: "
			read newUser
			echo $newUser:S >> /etc/Talha/talha_user.txt
			echo ""
			echo "Input password: "
			read newPass
			echo $newPass >> /etc/Talha/talha_pass.txt
			echo ""
			echo "Success. New User Created!"
		else
			echo ""
			echo "Incorrect Password. Please Try Again!"
		fi
	fi
else
	echo "Incorret Hostname. Please Try Again!"
fi
