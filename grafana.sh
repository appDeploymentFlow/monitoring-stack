export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
apt update && apt install -y apt-transport-https wget gnupg2
mkdir -p /etc/apt/keyrings
wget -O /etc/apt/keyrings/grafana.asc https://apt.grafana.com/gpg.key
chmod 644 /etc/apt/keyrings/grafana.asc
echo "deb [signed-by=/etc/apt/keyrings/grafana.asc] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list
apt update && apt install -y grafana
#4. check the status of grafana and start it
#service grafana status
#service grafana start
#4. Start and enable the Grafana service:
#	$ sudo systemctl daemon-reload
#	$ sudo systemctl enable --now grafana-server   
#5. Verify the service is running:
#	$ sudo systemctl status grafana-server 
# echo "to start use service grafana-server restart or service grafana-server start"  
# echo "http://your-server-ip:3000"
# echo "add deshboard after adding connection use 1860"