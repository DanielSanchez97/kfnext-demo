resource "aws_security_group" "web_access" {
    name = "web_access"
    description = "allow inbound http traffic"

}

resource "aws_security_group" "ssh" {
    name = "ssh"
    description = "allow inbound http traffic"

}


resource "aws_security_group_rule" "allowTCP" {
    type = "ingress"
    from_port = 5000
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.web_access.id}"
}


resource "aws_security_group_rule" "allowHTTP1" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.web_access.id}"
}

resource "aws_security_group_rule" "allowHTTP2" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.web_access.id}"
}

resource "aws_security_group_rule" "allowEgress" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.web_access.id}"
}

resource "aws_security_group_rule" "allowSSHEgress" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.ssh.id}"
}

resource "aws_security_group_rule" "allowSSH" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["152.2.0.0/16", "152.19.0.0/16", "152.23.0.0/16"]

    security_group_id = "${aws_security_group.ssh.id}"
}