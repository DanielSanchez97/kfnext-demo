resource "aws_security_group" "web_access" {
    name = "web_access"
    description = "allow inbound http traffic"

    ingress{
        from_port = 5000
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "ssh" {
    name = "ssh"
    description = "allow inbound http traffic"

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["152.2.0.0/16", "152.19.0.0/16", "152.23.0.0/16"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

