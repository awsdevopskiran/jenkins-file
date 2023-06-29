# used map instead of list to get named resources
locals {
  queues = {
    "cd" : {},
    "td" : {},
    "tr" : {}
  }
}

resource "aws_sqs_queue" "dlq" {
  name = "${var.stage}-${var.name_prefix}-dead-letter-queue"
  tags = var.generic_tags
}

resource "aws_sqs_queue" "logger" {
  name = "${var.stage}-${var.name_prefix}-logger-queue"
  message_retention_seconds   = 14*24*60*60
  receive_wait_time_seconds   = 0
  visibility_timeout_seconds  = 30
  tags = var.generic_tags
}

resource "aws_sqs_queue" "staging_queues" {
  for_each                    = local.queues
  name                        = "${var.stage}-${var.name_prefix}-${each.key}-staging-queue.fifo"
  fifo_queue                  = true
  message_retention_seconds   = 60
  receive_wait_time_seconds   = 0
  content_based_deduplication = true
  visibility_timeout_seconds  = 30
  tags                        = var.generic_tags
}

resource "aws_sqs_queue" "execution_queues" {
  for_each                   = local.queues
  name                       = "${var.stage}-${var.name_prefix}-${each.key}-execution-queue"
  message_retention_seconds  = 60
  receive_wait_time_seconds  = 0
  visibility_timeout_seconds = 300
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 1
  })

  tags = var.generic_tags
}