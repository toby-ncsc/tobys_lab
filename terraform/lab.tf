terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "tjcwilk-toby-lab-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-1"    # Replace this with your DynamoDB table name!
    dynamodb_table = "tjcwilk_toby_lab_terraform_locks"
    encrypt        = true
  }
}

provider "aws" {
    profile = "default"
    region = "eu-west-1"
}

module "test_linux" { 
    source = "./modules/test_linux"
    instance_name = "tjcwilk_test_instance"
    vpc = "vpc-b919a9de"
    subnet = "subnet-1b758440"
    ssh_keypair = "tjcwilk-awskey"
    owner = "tjcwilk"
}


