resource "aws_subnet" "subnet1" {
  vpc_id = "${var.vpcid}"
  availability_zone = "${var.availabilityZone}"
  cidr_block        = "${var.subnet1cidr}"
}

resource "aws_security_group" "sginstance" {
  name = "terraform-example-instance"
  vpc_id = "${var.vpcid}"
  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myserver1" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.subnet1.id}"
  vpc_security_group_ids = ["{aws_security_group.sginstance}"]



  tags = {
    Name = "terraform-myserver1"
  }
}

resource "aws_launch_configuration" "myserver1lc" {
  image_id = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  security_groups = [aws_security_group.sginstance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World!" > index.html
              nohup busybox httpd -f -p 8080 &
            EOF
}

resource "aws_autoscaling_group" "myserver1-asg" {
  launch_configuration = aws_launch_configuration.myserver1lc.name

  min_size = 2
  max_size = 3
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "terraform-myserver1-asg"
  }
}
