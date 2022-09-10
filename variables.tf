#GEneral COnfiguration
variable "region" {
  type = string
}

variable "profile" {
  type    = string
  default = "default"
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}


## Security Group ##
variable "ports_ingress" {
  type    = list(any)
  default = []
}

variable "ports_egress" {
  type    = list(any)
  default = []
}

variable "sg_name" {
  type = string
}

## Nginx Instance ##

variable "instance_type" {
  type = string
}