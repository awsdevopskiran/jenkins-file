variable "REGION" {
    type = string
    default = "ap-south-1"
}

variable "INSTANCE_TYPE" {
    type = string
    default = "t2.nano"
}

variable "AMI_STAGE" {
  type    = string
  default = "dev"
}

variable "BASE_IMAGES" {
  type    = string
  default = "ami-0fa00cc8f1b1a5c90"
}

variable "SUBNET_ID" {
  type    = string
  default = "subnet-011a31fa5daa35bb6"
}

variable "VPC_ID" {
  type    = string
  default = "vpc-0a1f065c6bb328ebf"
}

variable "VALUME_SIZE" {
  type    = number
  default = 50
}
