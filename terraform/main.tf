resource "aws_subnet" "subnet1" {
  vpc_id = "${var.vpcid}"
  availability_zone = "${var.availabilityZone}"
  cidr_block        = "${var.subnet1cidr}"
}

resource "aws_instance" "myserver1" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.subnet1.id}"

  tags = {
    Name = "terraform-myserver1"
  }
}
