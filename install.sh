# update package
sudo apt-get update

# add gpg key
curl -fsSL https://repos.influxdata.com/influxdata-archive_compat.key|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/influxdata.gpg

# add repo
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list

# install
sudo apt update && sudo apt install influxdb2

# enable influxdb service
sudo systemctl enable --now influxdb

# check services
sudo systemctl status influxd

# allow firewall
sudo ufw allow 8086/tcp

# config influxdb
sudo influx setup