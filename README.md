# What is Terraform
- Terraform is an IAC orchestration tool - allows you to create IAC for deployment on any cloud
- HashiCorp product

## Why Terraform
- Helps you scale up and down as per user demand

### Best use cases
- Not restricted to a single cloud provider - multi-cloud
 
**Other IAC tools**
- Orchestration with Terraform
- AMI to EC2 with customised configuration

## Creating instances using terraform
- After having created an AMI using packer, you can then use terraform to create an instance on a cloud provider like aws

### Create file to hold variables
- When creating instances, some variables will often be reused
- instead of having to spell type them out each time, you can store them in a file and then call them when and as needed
- Create a file called variable.tf
- Specify the name of the variable and its value:
```terraform
variable "region" {
	default = "eu-west-1"
}
```
- I can then call the variable "region" in other .tf files using ```var.region```

### Create instance
- To create am instance, create a file called main.tf
- Specify the cloud provider that will host your instance, and the region of the data centre:
```terraform
provider "aws" {
	region = var.region
}
```
- You can then specify the details required when creating an instance, in this case, an ec2 instance on aws:
```terraform
resource "aws_instance" "nodejs_instance" {

	ami = var.ami-nodeapp
	instance_type = var.instance-type
	associate_public_ip_address = true
	tags = {
	    Name = "eng74-ubaid-terraform-nodeapp"
	}
	key_name = var.aws-key
}
```

### Create subnet
- You can also create subnet using terraform
- In the main.tf file, write a resource block, starting by specifying that the resource being created is an aws subnet
- Then specify the vpc id of the VPC in which the subnet is being created, as well the latter's cidr block:
```terraform
resource "aws_subnet" "ubaid_subnet" {
	vpc_id     = var.devops-vpc-id
	cidr_block = "172.31.211.0/24"

	tags = {
	  Name = "ubaid_subnet"
  	}
}
```

### Running terraform files
- Once the files containing the instructions for creating the desired resources (instances, subnets etc.) are created, run the commands:
- ``` terraform plan ```
- ``` terraform apply ```