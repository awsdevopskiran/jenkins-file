variable "VPC_id" {
    type = string
    description = "kyc-ocr VPC id"
    default = "vpc-05f8a37cc781b7691"
}

variable "AMI_ID" {
    type = string
    description = "kyc-ocr vm AMI id"
    default = "ami-01a2fd3789ba59b13"
}


variable "Instance_Type" {
    type = string
    description = "kyc-ocr vm Instance type"
    default = "g4dn.xlarge"
}

variable "subnet_id" {
    type = string
    description = "kyc-ocr-subnet-id"
    default = "subnet-0efa788d43d86acd7"
}

variable "Valume_size" {
    type = string
    description = "kyc-ocr vm valume size"
    default = 20
}


variable "valume_type" {
    type = string
    description = "kyc-ocr vm valume type"
    default = "gp3"
}

variable "stage" {
    type = string
    description = "kyc-ocr vm stage"
    default = "dev"
}
