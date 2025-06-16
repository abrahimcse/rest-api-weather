output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.main_subnet.id
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

