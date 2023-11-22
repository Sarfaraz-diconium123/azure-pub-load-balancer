#!/bin/bash
sudo apt update -y
sudo apt install sshpass -y
colors=(yellow green blue)
for i in {0..2}
do
j=$(($i + 4))
ip="10.0.2.$j"
sshpass -p "VMP@55w0rd" \
ssh -o StrictHostKeyChecking=no kodekloud@$ip bash -c  \
"'export VAR=$i
printenv | grep VAR
echo "Setting up webserver-0$i VM"
sudo apt install apache2 -y
sudo mkdir /var/www/
sudo chmod -R -v 777 /var/www/
sudo mkdir /var/www/html/
#sudo curl -o /var/www/html/index.html "https://raw.githubusercontent.com/Sarfaraz-diconium123/azure-pub-load-balancer/main/Azure%20Load%20Balancer/sample.html" 
sudo curl "https://raw.githubusercontent.com/Sarfaraz-diconium123/azure-pub-load-balancer/main/Azure%20Load%20Balancer/sample.html" > /var/www/html/index.html
sed -i "s/PAGECOLOR/${colors[$i]}/g" /var/www/html/index.html
exit
'"
done
