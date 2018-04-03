resource "aws_vpc" "k8s" {
  cidr_block = "10.0.0.0/16"
}
