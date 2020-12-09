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

for ARGUMENT in "$@"
do
        KEY=$(echo $ARGUMENT | cut -f1 -d=)
        VALUE=$(echo $ARGUMENT | cut -f2 -d=)
        case "$KEY" in
                X)      X=${VALUE};;
                Y)      Y=${VALUE};;
                *)
        esac
done

input="$X"
if test $cmd = $input
then
	#echo "Success!"
	if test "$size" = "0"
	then
		pass="$Y"
		echo $pass > /etc/Talha/talha_pass.txt
	else
		#echo "Password: $Y"
		#read password
		password="$Y"
		if test $password = $file
		then
			echo ""
			echo "Success! Logged in as Muhammad-Talha-VM"
		else
			echo ""
			echo "Incorrect Password. Please Try Again!"
		fi
	fi
else
	echo ""
	echo "Incorrect Hostname. Please Try Again!"
	echo ""
fi
