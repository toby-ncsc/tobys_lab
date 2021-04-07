resource "aws_instance" "ec2_test_instance" {

    ami = "ami-0aef57767f5404a3c" # ubuntu server 20.04
    instance_type = "t2.micro"
    subnet_id = var.subnet
    associate_public_ip_address  = true
    vpc_security_group_ids = [aws_security_group.sg_allow_all.id]
    key_name = var.ssh_keypair
    user_data = file("${path.module}/bootstrap.sh")
    tags = {
        Name = "${var.instance_name}_ec2",
        owner = var.owner
        description = <<EOT
            A test linux box. Bootsraps docker and runs hello-world. 
            Used for testing terraform.
            EOT
    }
}

resource "aws_security_group" "sg_allow_all" {
    name = "tjcwilk_sg_allow_all"
    description = "a basic security group, that allows all"
    vpc_id = var.vpc

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}