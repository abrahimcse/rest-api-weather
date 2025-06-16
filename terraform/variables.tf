variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "availability_zone" {
  description = "Availability zone for subnet"
  type        = string
  default     = "ap-southeast-1a"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  default     = "10.0.1.0/24"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  default     = "my_eks_cluster"
}

