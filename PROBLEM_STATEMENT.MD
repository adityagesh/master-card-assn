# Problem Statement
Using Terraform V12, build a module meant to deploy a web application that supports the following design:

·       It must include a VPC which enables future growth / scale

·       It must include both a public and private subnet – where the private subnet is used for compute and the public is used for the load balancers

·       Assuming that the end-users only contact the load balancers and the underlying instance are accessed for management purposes, design a security group scheme which supports the minimal set of ports required for communication.

·       The AWS generated load balancer hostname with be used for request to the public facing web application.

·       An autoscaling group should be created which utilizes the latest AWS AMI

·       The instance in the ASG

o   Must contain both a root volume to store the application / services

o   Must contain a secondary volume meant to store any log data bound from / var/log

o   Must include a web server of your choice.