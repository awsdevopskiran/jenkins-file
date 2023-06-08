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

/* 
variable "BASE_IMAGES" {
  type    = string
  default = "ami-0f5ee92e2d63afc18"
}
*/

variable "SUBNET_ID" {
  type    = string
  default = "subnet-0515daf167c9c7c7e"
}

variable "VPC_ID" {
  type    = string
  default = "vpc-0a1f065c6bb328ebf"
}

variable "VALUME_SIZE" {
  type    = number
  default = 100
}
