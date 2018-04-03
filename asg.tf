resource "aws_autoscaling_group" "k8s_controllers" {
  name                 = "k8s_controllers"
  max_size             = 3
  min_size             = 3
  desired_capacity     = 3
  force_delete         = false
  launch_configuration = "${aws_launch_configuration.k8s_launch_config.name}"                           //?
  vpc_zone_identifier  = ["${aws_subnet.k8s-a.id}", "${aws_subnet.k8s-b.id}", "${aws_subnet.k8s-c.id}"]
}

resource "aws_launch_configuration" "k8s_launch_config" {
  name = "k8s_blal"

  image_id      = "ami-f90a4880"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}
