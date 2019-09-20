resource "aws_route53_zone" "daniel-kenan-ai" {
  name = "daniel.kenan.ai"

  tags = {
    terraform = "1"
  }

  depends_on = ["aws_instance.example"]
}


resource "aws_route53_zone" "dev-daniel-kenan-ai" {
  name = "dev.daniel.kenan.ai"

  tags = {
    terraform = "1"
  }
}