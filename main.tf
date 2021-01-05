# which cloud provider is needed
# using aws because our AMIs are on aws

provider "aws" {

	region = var.region
#	access_key = "TF_VAR_AWS_ACCESS_KEY"
#	secret_key = "TF_VAR_AWS_SECRET_KEY"
}

resource "aws_instance" "nodejs_instance" {

	ami = var.ami-nodeapp
	#ami = "ami-09b9e380df60300c8"
	instance_type = var.instance-type
	associate_public_ip_address = true
	tags = {
	    Name = "eng74-ubaid-terraform-nodeapp"
	}
	key_name = var.aws-key
}

resource "aws_instance" "mongodb_instance" {

        ami = var.ami-mongodb
        #ami = "ami-09b9e380df60300c8"
        instance_type = var.instance-type
        associate_public_ip_address = true
        tags = {
            Name = "eng74-ubaid-terraform-mongodb"
        }
        key_name = var.aws-key
}

resource "aws_subnet" "ubaid_subnet" {
	vpc_id     = var.devops-vpc-id
	cidr_block = "172.31.211.0/24"

	tags = {
	  Name = "ubaid_subnet"
  	}
}
