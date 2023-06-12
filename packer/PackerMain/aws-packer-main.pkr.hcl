packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.5"
      source = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  ami_name = "${var.AMI_STAGE}-kyc-ocr-base-AMI"
}


source "amazon-ebs" "packer-image" {
  
  ami_name        = local.ami_name
  ami_description = "Instance Image as per: ${timestamp()}.This ami is created using packer."
  region          = "${var.REGION}"
  instance_type   = "${var.INSTANCE_TYPE}"
  source_ami      = "${var.BASE_IMAGES}"
  ami_users       = ["709754666466"]
  #most_recent	  = true
  #owners	  = [""]
  vpc_id    = "${var.VPC_ID}"
  subnet_id = "${var.SUBNET_ID}"
  ssh_pty   = false
  tags = {
    Stage   = "${var.AMI_STAGE}"
    Name    = local.ami_name
  }

  launch_block_device_mappings {
    device_name           = "/dev/sda1"
    volume_size           = "${var.VALUME_SIZE}"
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
    "source.amazon-ebs.packer-image"
  ]

  provisioner "shell" {

    inline = ["aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 709754666466.dkr.ecr.ap-south-1.amazonaws.com"]
  }

  
  post-processor "manifest" {}
}