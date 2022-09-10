#!/bin/bash

echo "Installing nginx"
sudo yum install nginx -y

#check if nginx services are up
sudo systemctl enable nginx
sudo systemctl start nginx