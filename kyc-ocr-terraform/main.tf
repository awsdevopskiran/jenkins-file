locals {
  ami_name = "${var.stage}-kyc-ocr-VM"
}


resource "aws_instance" "kyc-ocr-VM" {
  ami           = "${var.AMI_ID}"
  instance_type = "${var.Instance_Type}"
  

  vpc_security_group_ids = [aws_security_group.kyc_ocr_sec_group.id]
  subnet_id = "${var.subnet_id}"

  root_block_device {
    volume_size = "${var.Valume_size}"
    volume_type = "${var.valume_type}"
  }

  tags = {
    stage = "${var.stages}"
    Name = local.ami_name
  }
}
