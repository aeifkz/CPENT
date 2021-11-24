
#Scan Host Port 
result=$(nmap -n -sn -PS22,80,443,445,3389 $1)

#echo with "$variable" show the newline symbol
host_list=$(echo "$result" | grep "Nmap scan report for" | cut -d ' ' -f 5)

#create directory and output file
mkdir -p nmap_output
cd nmap_output

for host in $host_list
do
	echo "scan host $host..."
	nmap -Pn $host -oA $host
done
