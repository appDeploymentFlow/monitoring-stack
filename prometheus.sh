export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
apt-get update
apt-get install -y wget vim curl tzdata
wget https://github.com/prometheus/prometheus/releases/download/v3.0.1/prometheus-3.0.1.linux-amd64.tar.gz -P /tmp/
tar -xvzf /tmp/prometheus-3.0.1.linux-amd64.tar.gz -C /opt/
cd /opt/prometheus-3.0.1.linux-amd64/
cat << INNER_EOF >> prometheus.yml
#global:
# scrape_interval: 15s

#scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets:
        - 'db:9100'
        - 'backend:9100'
        - 'frontend:9100'
#   - job_name: 'nginx-prometheus-exporter'
#     static_configs:
#       - targets:
# #        - 'frontend-server-ip:9113'
# 		- 'frontend:9113'
#   - job_name: 'mysqld_exporter'
#     static_configs:
#       - targets:
# #        - 'db-server-ip:9104'
# 		- 'db:9104'
#   - job_name: 'grok_exporter'
#     static_configs:
#       - targets:
# #        - 'backend-server-ip:9144'
# 		- 'backend:9144'
INNER_EOF
# 5. Run Prometheus
#first modify prometheus.yml file then start
#./prometheus --config.file=prometheus.yml