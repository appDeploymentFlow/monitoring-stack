wget -P /tmp/ https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz
tar xvzf /tmp/node_exporter-1.10.2.linux-amd64.tar.gz -C /opt/
cd /opt/node_exporter-1.10.2.linux-amd64/
./node_exporter &&