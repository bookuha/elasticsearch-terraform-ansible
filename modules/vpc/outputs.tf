output "vpc_id" {
    description = "The ID of the VPC"
    value = aws_vpc.main.id
}

output "vpc_cidr" {
    description = "The CIDR block of the VPC"
    value = aws_vpc.main.cidr_block
}

output "public_subnet_id" {
    description = "The public subnet's id of the VPC"
    value = aws_subnet.public.id
}