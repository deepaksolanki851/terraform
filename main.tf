provider "aws" {
  region = "ap-south-1"
}

variable "cidr_blocks" {
  description = "cidr block values for subnet and vpc"
  type = list(string)
}

variable avail_zone{}

resource "aws_vpc" "production_vpc" {
  cidr_block = var.cidr_blocks[0]
 tags = {
  Name: "Production"
   }
}

resource "aws_subnet" "Prod_Subnet" {
 vpc_id = aws_vpc.production_vpc.id 
 cidr_block = var.cidr_blocks[1]
 availability_zone = var.avail_zone
 tags = {
  Name: "Prod-Subnet"
 }
}
