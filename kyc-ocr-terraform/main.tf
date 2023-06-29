

provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "kyc-ocr-VM" {
  ami           = "ami-01a2fd3789ba59b13"
  instance_type = "t2.micro"
  

  vpc_security_group_ids = [aws_security_group.kyc_ocr_sec_group.id]
  subnet_id = "subnet-052915c54cc42cc9c"

  root_block_device {
    volume_size = "20"
    volume_type = "gp3"
  }

  tags = {
    Name = "kyc_ocr_VM"
  }
}










