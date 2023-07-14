
resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.stage}-${var.name_prefix}-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_elasticache_replication_group" "meta_replica_group" {

  count = var.redis == "false" ? 1 : 0
  replication_group_id = "${var.stage}-${var.name_prefix}-meta"

  
  automatic_failover_enabled    = true
  engine                        = "redis"
  replication_group_description = "Meta Replica Group for ${var.name_prefix} Stage ${var.stage}"
  node_type                     = var.redis_meta_cluster.node_type
  number_cache_clusters         = var.redis_meta_cluster.number_of_replica
  parameter_group_name          = "default.redis6.x.cluster.on"
  port                          = 6379
  engine_version                = "6.x"
  security_group_ids            = [module.redis_sg.security_group_id]
  subnet_group_name             = aws_elasticache_subnet_group.default.name
  lifecycle {
    # kept 'engine_version' here due to bug in Terraform [https://github.com/hashicorp/terraform-provider-aws/issues/15625]
    ignore_changes = [number_cache_clusters, engine_version]
  }
}

resource "aws_elasticache_replication_group" "data_replica_group" {

  count = var.redis == "false" ? 1 : 0
  replication_group_id = "${var.stage}-${var.name_prefix}-data"

  automatic_failover_enabled    = true
  engine                        = "redis"
  replication_group_description = "Data Replica Group for ${var.name_prefix} Stage ${var.stage}"
  node_type                     = var.redis_data_cluster.node_type
  number_cache_clusters         = var.redis_data_cluster.number_of_replica
  parameter_group_name          = "default.redis6.x.cluster.on"
  port                          = 6379
  engine_version                = "6.x"
  security_group_ids            = [module.redis_sg.security_group_id]
  subnet_group_name             = aws_elasticache_subnet_group.default.name
  lifecycle {
    # kept 'engine_version' here due to bug in Terraform [https://github.com/hashicorp/terraform-provider-aws/issues/15625]
    ignore_changes = [number_cache_clusters, engine_version]
  }
}

