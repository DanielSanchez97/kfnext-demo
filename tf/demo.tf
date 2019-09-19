terraform{
  backend "s3" {
    bucket = "daniel-teraform-demo1"
    key = "tf"
    region = "us-west-1"
  }
}


provider "aws" {
  profile    = "default"
  region     = "${var.region}"
}

resource "aws_instance" "example" {
    ami = "${var.amis["${var.region}"]}"
    instance_type = "t3.micro"

    key_name = "${aws_key_pair.daniel-key-pair.key_name}"

    security_groups = ["${aws_security_group.web_access.name}", "${aws_security_group.ssh.name}"]

    user_data = "${data.template_file.create-user.rendered}"

}

resource "aws_instance" "dev_example" {
    ami = "${var.amis["${var.region}"]}"
    instance_type = "t3.micro"

    key_name = "${aws_key_pair.daniel-key-pair.key_name}"

    security_groups = ["${aws_security_group.web_access.name}", "${aws_security_group.ssh.name}"]

    user_data = "${data.template_file.create-user.rendered}"

}


resource "aws_route53_record" "daniel" {
  zone_id = "${aws_route53_zone.daniel-kenan-ai.zone_id}"
  name    = "${aws_route53_zone.daniel-kenan-ai.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_instance.example.public_ip}"]
}

resource "aws_route53_record" "danielNS" {
  zone_id = "${aws_route53_zone.daniel-kenan-ai.zone_id}"
  name    = "dev.${aws_route53_zone.daniel-kenan-ai.name}"
  type    = "NS"
  ttl     = "60"
  records = [
    "${aws_route53_zone.dev-daniel-kenan-ai.name_servers.0}",
    "${aws_route53_zone.dev-daniel-kenan-ai.name_servers.1}",
    "${aws_route53_zone.dev-daniel-kenan-ai.name_servers.2}",
    "${aws_route53_zone.dev-daniel-kenan-ai.name_servers.3}"
  ]
}

resource "aws_route53_record" "dev_daniel" {
  zone_id = "${aws_route53_zone.dev-daniel-kenan-ai.zone_id}"
  name    = "${aws_route53_zone.dev-daniel-kenan-ai.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_instance.dev_example.public_ip}"]
}


variable "region"{
  default = "us-west-1"
}

variable "amis"{
  type = "map"
  default = {
    "us-east-2" = "ami-0e7c12c1bedd6bf21"
    "us-west-1" = "ami-08a12265d9e050d57"
  }
}

data "template_file" "create-user" {
  template = "${file("cloud-init/add-user.tpl")}"

  vars = {
    daniel-key = "${file("./keys/daniel.pub")}"
  }
}

