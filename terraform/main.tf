provider "aws" {
  region = var.region
}

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "main_subnet_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.az1
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet1_name
  }
}

resource "aws_subnet" "main_subnet_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet2_cidr
  availability_zone       = var.az2
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet2_name
  }
}

resource "aws_iam_role" "eks_role" {
  name = var.eks_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.main_subnet_1.id,
      aws_subnet.main_subnet_2.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}
