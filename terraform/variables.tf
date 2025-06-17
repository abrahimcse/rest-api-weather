variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "main-vpc"
}

variable "subnet1_cidr" {
  description = "Subnet 1 CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  description = "Subnet 2 CIDR block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az1" {
  description = "Availability Zone for Subnet 1"
  type        = string
  default     = "ap-southeast-1a"
}

variable "az2" {
  description = "Availability Zone for Subnet 2"
  type        = string
  default     = "ap-southeast-1b"
}

variable "subnet1_name" {
  description = "Name for Subnet 1"
  type        = string
  default     = "main-subnet-1"
}

variable "subnet2_name" {
  description = "Name for Subnet 2"
  type        = string
  default     = "main-subnet-2"
}

variable "eks_role_name" {
  description = "IAM Role name for EKS Cluster"
  type        = string
  default     = "eks-cluster-role"
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "my_eks_cluster"
}
