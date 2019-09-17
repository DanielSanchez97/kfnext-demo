resource "aws_eip" "ip" {
    vpc = true
    instance = "${aws_instance.example.id}"
}