resource "aws_subnet" "k8s-a" {
  vpc_id     = "${aws_vpc.k8s.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags {
    Name = "k8s"
  }
}

resource "aws_subnet" "k8s-b" {
  vpc_id     = "${aws_vpc.k8s.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags {
    Name = "k8s"
  }
}

resource "aws_subnet" "k8s-c" {
  vpc_id     = "${aws_vpc.k8s.id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1c"

  tags {
    Name = "k8s"
  }
}

# Why doesn't this work?
# resource "aws_network_acl" "k8s" {
#   vpc_id = "${aws_vpc.k8s.id}"
#   subnet_ids = [ "${aws_subnet.k8s-a.id}", "${aws_subnet.k8s-b.id}", "${aws_subnet.k8s-c.id}" ]
#
#   ingress {
#     protocol   = "tcp"
#     rule_no    = 1
#     action     = "allow"
#     from_port  = 22
#     to_port    = 22
#   }
#
#   ingress {
#     protocol   = "tcp"
#     rule_no    = 2
#     action     = "allow"
#     from_port  = 6443
#     to_port    = 6443
#   }
#
#   tags {
#     Name = "k8s"
#   }
# }

resource "aws_network_acl" "k8s-a" {
  vpc_id = "${aws_vpc.k8s.id}"
  subnet_ids = [ "${aws_subnet.k8s-a.id}" ]

  ingress {
    protocol   = "tcp"
    rule_no    = 1
    cidr_block = "${aws_subnet.k8s-a.cidr_block}"
    action     = "allow"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 2
    cidr_block = "${aws_subnet.k8s-a.cidr_block}"
    action     = "allow"
    from_port  = 6443
    to_port    = 6443
  }

  tags {
    Name = "k8s"
  }
}

resource "aws_network_acl" "k8s-b" {
  vpc_id = "${aws_vpc.k8s.id}"
  subnet_ids = [ "${aws_subnet.k8s-b.id}" ]

  ingress {
    protocol   = "tcp"
    rule_no    = 1
    cidr_block = "${aws_subnet.k8s-b.cidr_block}"
    action     = "allow"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 2
    cidr_block = "${aws_subnet.k8s-b.cidr_block}"
    action     = "allow"
    from_port  = 6443
    to_port    = 6443
  }

  tags {
    Name = "k8s"
  }
}

resource "aws_network_acl" "k8s-c" {
  vpc_id = "${aws_vpc.k8s.id}"
  subnet_ids = [ "${aws_subnet.k8s-c.id}" ]

  ingress {
    protocol   = "tcp"
    rule_no    = 1
    cidr_block = "${aws_subnet.k8s-c.cidr_block}"
    action     = "allow"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 2
    cidr_block = "${aws_subnet.k8s-c.cidr_block}"
    action     = "allow"
    from_port  = 6443
    to_port    = 6443
  }

  tags {
    Name = "k8s"
  }
}
