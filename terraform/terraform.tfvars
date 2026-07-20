
aws_region           = "us-east-1"
vpc_cidr_block       = "10.0.0.0/16"
backend_ecr_url      = "893493035367.dkr.ecr.us-east-1.amazonaws.com/polling-app-server"
frontend_ecr_url     = "893493035367.dkr.ecr.us-east-1.amazonaws.com/polling-app-client"
db_username          = "dbadmin"
db_password          = "mysql123"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

