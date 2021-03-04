# master-card-assn
Mastercard take home assignment

# Assumptions
- Only environment is required
- IPv4 is used


# Architecture Description
- 3 Public subnets, 3 private subnets across AZs
- Internet Gateway attached to public subnet route table
- NAT Gateway attached to default route table
- EC2 image used: Ubuntu 20 LTS
- Apache webserver is accessible via http
- EBS volume encrypted using default ebs encryption key
- Apache2 has log rotated enabled to handle increasing log size


# Instructions to deploy
## Run the below commands in order
1. If AWS CLI is not configured, export `AWS_ACCESS_KEY_ID` & `AWS_SECRET_ACCESS_KEY`
2. Run `terraform init`
3. Change params in `variables.tf` if required
3. Run `terraform plan -out=aws_infra_plan`
4. Run `terraform apply "aws_infra_plan"`