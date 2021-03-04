resource "aws_autoscaling_group" "ec2-webserver" {
  vpc_zone_identifier = var.private_subnets.*.id
  desired_capacity    = var.asg_config.desired_capacity
  max_size            = var.asg_config.max_size
  min_size            = var.asg_config.min_size
  target_group_arns   = [var.alb_target_group.arn]
  launch_template {
    id      = aws_launch_template.ec2-template.id
    version = "$Latest"
  }

  tag {
    key                 = "name"
    value               = "${var.project_name}-asg-${var.environment}"
    propagate_at_launch = true
  }
  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
}


resource "aws_launch_template" "ec2-template" {
  name_prefix            = "${var.project_name}-${var.environment}"
  image_id               = var.ami_ids["${var.region}"]
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2_webserver.id]

  user_data = base64encode(local.user_data)

  instance_initiated_shutdown_behavior = "terminate"
  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_type           = "gp2"
      volume_size           = 10
      delete_on_termination = true
      encrypted             = true
      kms_key_id            = data.aws_kms_key.ebs_default.arn
    }
  }

  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_type           = "gp2"
      volume_size           = 10
      delete_on_termination = true
      encrypted             = true
      kms_key_id            = data.aws_kms_key.ebs_default.arn
    }
  }

  tags = {
    Environment = var.environment
  }
}

