#!/bin/bash
cd /tmp
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
wget https://raw.githubusercontent.com/adityagesh/master-card-assn/main/scripts/resources/cloudwatch_agent_config.json
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:cloudwatch_agent_config.json