variable "environment" {
  description = "The environment name"
  type        = string
}

variable "sub_environment" {
  description = "The sub-environment name"
  type        = string
  default     = ""
}

variable "instance_size" {
  description = "The size of the instance"
  type        = string
}

variable "rdb_size" {
  description = "The size of the RDB"
  type        = string
}

variable "nosql_size" {
  description = "The size of the NoSQL DB"
  type        = string
}

variable "k8s_cluster_size" {
  description = "The size of the Kubernetes cluster"
  type        = string
}

variable "instance_count" {
  description = "The number of instances"
  type        = number
  default     = 1
}

variable "replica_count" {
  description = "The number of replicas for prod environment"
  type        = number
  default     = 1
}
