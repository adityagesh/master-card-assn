# master-card-assn
[Problem statement](./PROBLEM_STATEMENT.MD) 

# Assumptions
- Only IPv4 is required
- Terraform Modules for AWS should not be used
- S3 Backend not to be used for simplicity


# Architecture Description
- Supports multienv deployment using `terraform workspace`
- 3 Public subnets, 3 private subnets across AZs for High Availablity
- Internet Gateway attached to public subnet route table
- NAT Gateway attached to default route table
- Application Loadbalancer is used to loadbalance http traffic across ec2 instances
- EC2 image used: Ubuntu 20 LTS
- Two EBS volumes attached to EC2 - one for `/` and one for `/var/logs`
- Apache webserver is accessible via http
- Both EBS volume encrypted using aws/ebs encryption key
- Log rotation handles increasing log size
- Autoscaling based on CPU and Memory percentage usage using CloudWatch


# Instructions to deploy
## Run the below commands in order
1. If AWS CLI is not configured, export `AWS_ACCESS_KEY_ID` & `AWS_SECRET_ACCESS_KEY`
2. Run `terraform init`
3. Configure params using variables in `config.tfvars`  
3. Run `terraform plan -out=aws_infra_plan -var-file="config.tfvars"`
4. Run `terraform apply "aws_infra_plan"`