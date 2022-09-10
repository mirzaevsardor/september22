#General config
region = "us-east-1"
profile = "default"
#VPC
cidr                 = "10.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support   = true
enable_ipv6          = false

#security group
sg_name       = "rackner_sg"
ports_ingress = ["80", "443", "22"]
ports_egress  = ["0"]

#Nginx Instance
instance_type = "t2.micro"
