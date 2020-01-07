variable "vpcid" {
  description = "VPC ID already exists."
  default = "vpc-0c9319c67218fcc2b"
}

variable "subnet1cidr" {
  default = "10.0.1.0/24"
  description = "First Subnet CIDR"
}

variable "subnet2cidr" {
  default = "10.0.2.0/24"
  description = "Second Subnet CIDR"
}

variable "ami_id" {
  default = "ami-00068cd7555f543d5"
  description = "AMI ID"
}

variable "instance_type" {
  default = "t2.micro"
  description = "Instance Type"
}

variable "region" {
  default = "us-east-1"
  description = "US-EAST-1"
}

variable "availabilityZone" {
  default = "us-east-1a"
  description = "US EAST-1A"
}

