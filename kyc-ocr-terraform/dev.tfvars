stage  = "dev"
vpc_id = "vpc-05f8a37cc781b7691"

Valume_size = 20
valume_type = "gp3"
Instance_Type = "g4dn.xlarge"
Redis_baked_ami = "ami-00a67da7679d80224"
redis = true


generic_tags = {
  Stage : "dev",
  Terraform : "true"
}

private_subnet_ids = ["subnet-0efa788d43d86acd7", "subnet-06b481367a107dfab", "subnet-0478515b3b833d4e1"]

asg_instance_tags = {
  "email" : "shabab.t@karza.in",
  "team" : "DS",
  "state" : "STATELESS",
  "product" : "TOTALKYC",
  "environment" : "dev"
  "Terraform" : "true"
}

ml_model_workers = {
  "cd" : {
    image_id : "ami-0ed929e5fa34a2450",
    instance_type : "g4dn.xlarge",
    max_size : 20,
    min_size : 1,
    desired_size : 1,
    scaling_target_value : 320,
    ebs_optimized : false
  },
  "td" : {
    image_id : "ami-0ed929e5fa34a2450",
    instance_type : "g4dn.xlarge",
    max_size : 20,
    min_size : 1,
    desired_size : 1,
    scaling_target_value : 160,
    ebs_optimized : false
  },
  "tr" : {
    image_id : "ami-0ed929e5fa34a2450",
    instance_type : "g4dn.xlarge",
    max_size : 20,
    min_size : 1,
    desired_size : 1,
    scaling_target_value : 2400,
    ebs_optimized : false
  },
  "qr" : {
    image_id : "",
    instance_type : "inf1.xlarge",
    max_size : 20,
    min_size : 1,
    desired_size : 1,
    scaling_target_value : 1500,
    ebs_optimized : false
  }

}

pollers_task_definition = {
  cpu : 512,
  memory : 1024,
  taskRoleArn : "arn:aws:iam::611334599981:role/TA-ecs-kycOcr-pollersTaskRole",
  executionRoleArn : "arn:aws:iam::611334599981:role/TA-ecs-kycOcr-ecsTaskExecutionRole"
}

periodic_job_task_definition = {
  cpu : 256,
  memory : 512,
  taskRoleArn : "arn:aws:iam::611334599981:role/TA-ecs-kycOcr-metricPublisherTaskRole",
  executionRoleArn : "arn:aws:iam::611334599981:role/TA-ecs-kycOcr-ecsTaskExecutionRole"
}

addsplit_task_definition = {
  cpu : 1024,
  memory : 2048,
  taskRoleArn : "arn:aws:iam::611334599981:role/TA-ecs-kycOcr-addSplitTaskRole",
  executionRoleArn : "arn:aws:iam::611334599981:role/TA-ecs-kycOcr-ecsTaskExecutionRole",
  containerPort : 80
  hostPort : 80
}

db_logger_task_definition = {
  cpu : 256,
  memory : 512,
  taskRoleArn : "arn:aws:iam::611334599981:role/TA-ecs-kycOcr-dbLoggerTaskRole",
  executionRoleArn : "arn:aws:iam::611334599981:role/TA-ecs-kycOcr-ecsTaskExecutionRole"
}

pollers_task_container = {
  image_uri : "611334599981.dkr.ecr.ap-south-1.amazonaws.com/kyc-ocr/pollers"
}

periodic_job_container = {
  image_uri : "611334599981.dkr.ecr.ap-south-1.amazonaws.com/kyc-ocr/periodic-job"
}

db_logger_task_container = {
  image_uri : "611334599981.dkr.ecr.ap-south-1.amazonaws.com/kyc-ocr/db-logger"
}


addsplit_task_container = {
  image_uri : "611334599981.dkr.ecr.ap-south-1.amazonaws.com/kyc-ocr/addsplit"
}

redis_meta_cluster = {
  node_type : "cache.t3.micro"
  number_of_replica : 1
}

redis_data_cluster = {
  node_type : "cache.t3.micro"
  number_of_replica : 1
}

asg_ssh_key_name                       = "dsdeployment"
asg_tr_working_hours_scheduled_scaling = false
