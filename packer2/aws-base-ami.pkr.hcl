
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

data "amazon-ami" "example" {
    filters = {
        virtualization-type = "hvm"
        name = "ubuntu/images/*ubuntu-xenial-22.04-amd64-server-*"
        root-device-type = "ebs"
    }
    owners = ["709754666466"]
    most_recent = true
}

locals {
  source_ami_id = data.amazon-ami.example.id
  source_ami_name = data.amazon-ami.example.name
 }


source "amazon-ebs" "ubuntu_base_image" {

    # access_key = ""
    # secret_key = ""

    region          = "${var.REGION}"
    source_ami = local.source_ami_id
    ami_name        = local.ami_name
    ami_description = "Instance Image as per: ${timestamp()}.This ami is created using packer."
    instance_type   = "${var.INSTANCE_TYPE}" 
    vpc_id    = "${var.VPC_ID}"
    subnet_id = "${var.SUBNET_ID}"
    ami_users       = ["709754666466"]
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

    sources = ["source.amazon-ebs.ubuntu_base_image"]
    /*
    provisioner "shell" {
        script = "./scripts/awscli-setup.sh"
    }

    provisioner "shell" {
        script            = "./scripts/docker-setup.sh"
    }
  
    provisioner "shell" {
        script = "./scripts/disable-ubuntu-update.sh"
    }
    */
 


    post-processor "manifest" {}

}



