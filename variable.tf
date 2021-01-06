variable "region" {
	default = "eu-west-1"
}

variable "ami-nodeapp" {
	default = "ami-0a7f7dee43609cf57"
}

variable "ami-mongodb" {
	default = "ami-04e18f807dd29721b"
}

variable "instance-type" {
	default = "t2.micro"
}

variable "aws-key" {
	default = "eng74.ubaid.aws.key"
}

variable "devops-vpc-id" {
	default = "vpc-07e47e9d90d2076da"

}

variable "ubaid-vpc-id" {
	default = "vpc-03223e2af9c10ef89"
}

variable "ubaid-public-subnet-id" {
	default = "subnet-07fc0bec1e2249690"
}

variable "working-app-ami-id" {
	default = "ami-0651ff04b9b983c9f"
}

variable "nodeapp-sg" {
	default = "sg-0c3a6ac6413b2efda"
}
