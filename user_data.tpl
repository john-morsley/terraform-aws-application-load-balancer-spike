#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx -y

instance_id=$(curl http://169.254.169.254/latest/meta-data/instance-id)
echo "<h1>$instance_id</h1>" > /var/www/html/index.html

systemctl start nginx