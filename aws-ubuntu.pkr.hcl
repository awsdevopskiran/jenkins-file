# packer {
#   required_plugins {
#     amazon = {
#       version = ">= 0.0.2"
#       source  = "github.com/hashicorp/amazon"
#     }
#   }
# }
packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.5"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ami-stage" {
  type    = string
  default = "dev"
}
# variable "aws_access_key" {
#   description = "AWS Access Key"
#   type    = string
#   default = ["AKIA5DTDJLBR6BRLPENI"]
# }

# variable "aws_secret_key" {
#   description = "AWS Secret Key"
#   type    = string
#   default = ["uBJ0WSf/mFTMIgqKOeJrpDMdKeScoWpyhnasyFow"]
# }


locals {
  ami-name = "${var.ami-stage}-kyc-ocr-base-${uuidv4()}"
}

source "amazon-ebs" "ubuntu" {
  
#   access_key    = ""
#   secret_key    = ""
  access_key    = var.aws_access_key
  secret_key    = var.aws_secret_key
  ami_name        = local.ami-name
  ami_description = "Instance Image as per: ${timestamp()}.This ami is created using packer."
  region          = "us-east-1"
  instance_type   = "t2.micro"
  source_ami      = "ami-007855ac798b5175e"
  ami_users       = ["901077620835"]
  #most_recent	  = true
  #owners	  = [""]
  vpc_id    = "vpc-07850b63684aedf1f"
  subnet_id = "subnet-03845ab0ebbe41c36"
  ssh_pty   = false
  tags = {
    Stage   = "${var.ami-stage}"
    Product = "kyc-ocr"
    Name    = local.ami-name
  }

  ami_block_device_mappings {
    device_name           = "/dev/sda1"
    volume_size           = 100
    volume_type           = "gp3"
    delete_on_termination = true
    throughput            = 1000
    iops                  = 5000
    encrypted             = false
  }

  communicator = "ssh"
  ssh_username = "ubuntu"

}

build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

#   provisioner "shell" {
#     script = "./scripts/awscli-setup.sh"
#   }
#   provisioner "shell" {
#     script            = "./scripts/docker-setup.sh"
#     expect_disconnect = true
#   }
#   provisioner "shell" {
#     script            = "./scripts/nvdia-driver-setup.sh"
#     expect_disconnect = true
#   }
#   provisioner "shell" {
#     script = "./scripts/nvdia-ctntkt-setup.sh"
#   }
#   provisioner "shell" {
#     script = "./scripts/disable-ubuntu-update.sh"
#   }


#   post-processor "manifest" {}
}
