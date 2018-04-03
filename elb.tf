# resource "aws_eip" "lb" {
#   instance = "${k8s_elb.id}"
#   vpc      = true
# }
