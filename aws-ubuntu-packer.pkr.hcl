packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.5"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


variable "ami-stage" {
    type = string
    default = "dev"
}

locals {
    ami_name = "${var.ami-stage}-kyc-ocr-base-AMI"
}


source "amazon-ebs" "basic-example" {

  # profile = "customprofile"
  # assume_role {
  #     role_arn     = "arn:aws:iam::448949733093:role/Packer-role"
  #     # session_name = "SESSION_NAME"
  #     # external_id  = "EXTERNAL_ID"
  # }

  # access_key = ""
  # secret_key = ""

  ami_name = local.ami_name
  ami_description = "Instance Image as per: ${timestamp()}.this ami is created using packer"
  region = "ap-south-1"
  instance_type = "t2.macro"
  source_ami = "ami-0f5ee92e2d63afc18"
  ami_users = ["448949733093"]
  vpc_id = "vpc-06c9bc75794148fa7"
  subnet_id = "subnet-089d92a5260781896"
  ssh_pty = false
  tags = {
    Stage = "${var.ami-stage}"
    Name = local.ami_name
  }

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 10
    volume_type = "gp3"
    delete_on_termination = true
    throughput = 1000
    iops = 5000
    encrypted = false
  }

  communicator = "ssh"
  ssh_username = "ubuntu"
}

build {
  sources = [ 
    # type = "amazon-ebs",
    # region = "ap-south-1",
    "source.amazon-ebs.basic-example"
  ]
}
