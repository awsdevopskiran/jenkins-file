resource "aws_secretsmanager_secret" "secret" {
  description         = "${var.environment}"
  kms_key_id          = "${data.aws_kms_key.sm.arn}"
  name                = "${var.environment}-airflow-secret"
}
resource "random_string" "rds_password" {
  length = 16
  special = true
}


resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = "${aws_secretsmanager_secret.secret.id}"
  secret_string = <<EOF
{
  "rds_password": "${random_string.rds_password.result}"
  }
EOF
}
