variable "generic_tags" {
}

variable "name_prefix" {
  type    = string
  default = "kyc-ocr"
}

variable "stage" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

//# ECS Variables
variable "pollers_task_definition" {
  type = object({
    cpu : number,
    memory : number,
    taskRoleArn : string
    executionRoleArn : string
  })
}

variable "periodic_job_task_definition" {
  type = object({
    cpu : number,
    memory : number,
    executionRoleArn : string,
    taskRoleArn : string
  })
}


variable "db_logger_task_definition" {
  type = object({
    cpu : number,
    memory : number,
    executionRoleArn : string,
    taskRoleArn : string
  })
}

variable "addsplit_task_definition" {
  type = object({
    cpu : number,
    memory : number,
    executionRoleArn : string,
    taskRoleArn : string,
    containerPort : number,
    hostPort : number

  })
}

variable "pollers_task_container" {
  type = object({
    image_uri : string
  })
}

variable "periodic_job_container" {
  type = object({
    image_uri : string
  })
}

variable "db_logger_task_container" {
  type = object({
    image_uri : string
  })
}

variable "addsplit_task_container" {
  type = object({
    image_uri : string
  })
}

variable "asg_ssh_key_name" {
  type = string
}

variable "asg_instance_tags" {
  type = map(string)
}

variable "ml_model_workers" {
  type = object({
    cd : object({
      image_id : string,
      instance_type : string, // make sure the type is supported in the given subnets azs
      max_size : number,
      min_size : number
      desired_size : number
      scaling_target_value : number
      ebs_optimized : bool //make sure the instance_type supports ebs_optimized otherwise tf apply will stuck
    }),
    td : object({
      image_id : string,
      instance_type : string,
      max_size : number,
      min_size : number
      desired_size : number
      scaling_target_value : number
      ebs_optimized : bool
    }),
    tr : object({
      image_id : string,
      instance_type : string,
      max_size : number,
      min_size : number
      desired_size : number
      scaling_target_value : number
      ebs_optimized : bool
    }),
     qr : object({
      image_id : string,
      instance_type : string,
      max_size : number,
      min_size : number
      desired_size : number
      scaling_target_value : number
      ebs_optimized : bool
    })
  })
}

//
////# ASG Variables
//variable "cd_worker" {
//  type = object({
//    image_id : string,
//    instance_type : string, // make sure the type is supported in the given subnets azs
//    max_size : number,
//    min_size : number
//    desired_size : number
//    ebs_optimized : bool //make sure the instance_type supports ebs_optimized otherwise tf apply will stuck
//    //    instance_tags : map(string)
//  })
//}

# Redis Meta Cluster
variable "redis_meta_cluster" {
  type = object({
    node_type : string
    number_of_replica : number
  })
}

variable "redis_data_cluster" {
  type = object({
    node_type : string
    number_of_replica : number
  })
}

variable "asg_tr_working_hours_scheduled_scaling" {
  type    = bool
  default = false
}

variable "redis_vm_ami" {
    type = string
}


variable "redis_vm_instance_type" {
    type = string
}



variable "redis_vm_volume_size" {
    type = number
}


variable "redis_vm_volume_type" {
    type = string
}

variable "redis" {
  type = bool  
}





