resource "terraform_data" "instance" {
  count = var.instance_count
  input = {
    environment     = var.environment
    sub_environment = var.sub_environment
    name            = "${var.environment}${var.sub_environment != "" ? "-${var.sub_environment}" : ""}-instance-wks-${format("%02d", count.index + 1)}"
    size            = var.instance_size
    type            = "instance"
  }
}

resource "terraform_data" "rdb" {
  count = 1
  input = {
    environment     = var.environment
    sub_environment = var.sub_environment
    name            = "${var.environment}${var.sub_environment != "" ? "-${var.sub_environment}" : ""}-db-rdb-${format("%02d", count.index + 1)}"
    size            = var.rdb_size
    db_type         = "rdb"
    type            = "db"
  }
}

resource "terraform_data" "nosql" {
  count = 1
  input = {
    environment     = var.environment
    sub_environment = var.sub_environment
    name            = "${var.environment}${var.sub_environment != "" ? "-${var.sub_environment}" : ""}-db-nsdb-${format("%02d", count.index + 1)}"
    size            = var.nosql_size
    db_type         = "nosql"
    type            = "db"
  }
}

resource "terraform_data" "k8s_cluster" {
  count = 1
  input = {
    environment     = var.environment
    sub_environment = var.sub_environment
    name            = "${var.environment}${var.sub_environment != "" ? "-${var.sub_environment}" : ""}-k8s_cluster-kcls-${format("%02d", count.index + 1)}"
    size            = var.k8s_cluster_size
    type            = "k8s_cluster"
  }
}

# For replicas in prod environment
resource "terraform_data" "rdb_replica" {
  count = var.environment == "prod" ? var.replica_count : 0
  input = {
    environment     = var.environment
    sub_environment = var.sub_environment
    name            = "${var.environment}${var.sub_environment != "" ? "-${var.sub_environment}" : ""}-db-rdb-replica-${format("%02d", count.index + 1)}"
    size            = var.rdb_size
    db_type         = "rdb"
    type            = "db"
  }
}

resource "terraform_data" "nosql_replica" {
  count = var.environment == "prod" ? var.replica_count : 0
  input = {
    environment     = var.environment
    sub_environment = var.sub_environment
    name            = "${var.environment}${var.sub_environment != "" ? "-${var.sub_environment}" : ""}-db-nsdb-replica-${format("%02d", count.index + 1)}"
    size            = var.nosql_size
    db_type         = "nosql"
    type            = "db"
  }
}
