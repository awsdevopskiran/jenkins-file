# used map instead of list to get named resources
locals {
  queues = {
    "cd" : {},
    "td" : {},
    "tr" : {}
  }
}


resource "aws_sqs_queue" "staging_queues" {
  for_each                    = local.queues
  name                        = "kyc-ocr-staging-queue.fifo"
  message_retention_seconds   = 60
  receive_wait_time_seconds   = 0
  content_based_deduplication = true
  visibility_timeout_seconds  = 30
  tags                        = var.generic_tags
}

resource "aws_sqs_queue" "execution_queues" {
  for_each                   = local.queues
  name                       = "kyc-ocr-execution-queue"
  message_retention_seconds  = 60
  receive_wait_time_seconds  = 0
  visibility_timeout_seconds = 300

  tags = var.generic_tags
}
