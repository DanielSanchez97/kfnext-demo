resource "aws_route53_zone" "daniel-kenan-ai" {
  name = "daniel.kenan.ai"

  tags = {
    terraform = "1"
  }
}


resource "aws_route53_zone" "dev-daniel-kenan-ai" {
  name = "dev.daniel.kenan.ai"

  tags = {
    terraform = "1"
  }
}