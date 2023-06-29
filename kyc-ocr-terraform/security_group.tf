resource "aws_security_group" "kyc_ocr_sec_group" {
    name = "kyc/ocr/sec-group"
    description = "Security group allow this inbound rule"
    vpc_id = var.VPC_id

    ingress {
        description = "TLS from VPC"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}