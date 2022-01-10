variable "ec2_name_tag" {
  default = ["name1", "name2","name3"]
}

variable "instance_type" {
            #   0          1          2
  default = ["t2.micro", "t2.medium","t2.nano"]
}

variable "ami_ids" {
  default = {
    0 = "ami-00f7e5c52c0f43726",
    1 = "ami-0892d3c7ee96c0bf7",
    2 = "ami-0892d3c7ee96c0bf7"
  }
}

resource "aws_instance" "test" {
  count = length(var.ec2_name_tag)

  ami           = var.ami_ids[count.index]
  instance_type = var.instance_type[count.index]
  tags = {
    Name = var.ec2_name_tag[count.index]
  }
}

#resource "aws_instance" "test" {
#  for_each = var.ami_ids
#  ami           = each.value
#  instance_type = var.instance_type[each.key]
#  tags = {
#    Name = var.ec2_name_tag[each.key]
#  }
#}
