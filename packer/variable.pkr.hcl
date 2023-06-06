variable "REGION" {
    type = string
    default = "ap-south-1"
}

variable "INSTANCE_TYPE" {
    type = string
    default = "g4dn.xlarge"
}

variable "AMI_STAGE" {
  type    = string
  default = "dev"
}

variable "BASE_IMAGES" {
  type    = string
  default = "ami-01800bfa2b1507eaf"
}

variable "SUBNET_ID" {
  type    = string
  default = "subnet-0efa788d43d86acd7"
}

variable "VPC_ID" {
  type    = string
  default = "vpc-05f8a37cc781b7691"
}

variable "VALUME_SIZE" {
  type    = number
  default = 100
}
