# which cloud provider is needed
# using aws because our AMIs are on aws

provider "aws" {

	region = var.region
}

resource "aws_vpc" "ubaid_vpc" {
	cidr_block = "183.10.0.0/16"

	tags = {
	  Name = "ubaid_vpc"
	}
}

resource "aws_subnet" "ubaid_subnet_public" {
        vpc_id = var.ubaid-vpc-id
        cidr_block = "183.10.1.0/24"

        tags = {
            Name = "ubaid_subnet_public"
        }
}

resource "aws_internet_gateway" "ubaid-igw" {
	vpc_id = var.ubaid-vpc-id

	tags = {
	    Name = "ubaid-igw"
	}
}

resource "aws_instance" "nodejs_instance" {

	#ami = var.ami-nodeapp
        ami = var.working-app-ami-id
	instance_type = var.instance-type
	vpc_security_group_ids = [var.nodeapp-sg]
        subnet_id = var.ubaid-public-subnet-id
	associate_public_ip_address = true
	tags = {
	    Name = "eng74-ubaid-terraform-nodeapp"
	}
	key_name = var.aws-key
}

resource "aws_instance" "mongodb_instance" {

        ami = var.ami-mongodb
        instance_type = var.instance-type
        associate_public_ip_address = true
        tags = {
            Name = "eng74-ubaid-terraform-mongodb"
        }
        key_name = var.aws-key
}
