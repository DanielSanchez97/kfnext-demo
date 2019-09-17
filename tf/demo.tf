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

