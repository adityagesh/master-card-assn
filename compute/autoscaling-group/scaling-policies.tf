# Autoscaling CPU metric
resource "aws_autoscaling_policy" "cpu_scale_out" {
  name                      = "${var.project_name}-${var.environment}-cpu-scale-out"
  policy_type               = "StepScaling"
  adjustment_type           = "PercentChangeInCapacity"
  estimated_instance_warmup = 120
  autoscaling_group_name    = aws_autoscaling_group.ec2-webserver.name

  step_adjustment {
    scaling_adjustment          = 10
    metric_interval_lower_bound = 0
    metric_interval_upper_bound = 10
  }
  step_adjustment {
    scaling_adjustment          = 20
    metric_interval_lower_bound = 10
    metric_interval_upper_bound = null
  }
}

resource "aws_autoscaling_policy" "cpu_scale_in" {
  name                      = "${var.project_name}-${var.environment}-cpu-scale-in"
  policy_type               = "StepScaling"
  adjustment_type           = "PercentChangeInCapacity"
  estimated_instance_warmup = 120
  autoscaling_group_name    = aws_autoscaling_group.ec2-webserver.name

  step_adjustment {
    scaling_adjustment          = -10
    metric_interval_lower_bound = -20
    metric_interval_upper_bound = 0
  }
  step_adjustment {
    scaling_adjustment          = -20
    metric_interval_upper_bound = -20
    metric_interval_lower_bound = null
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_scale_out" {
  alarm_name          = "${var.project_name}-${var.environment}-cpu-scale-out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ec2-webserver.name
  }

  alarm_description = "Metric alarm for cpu scale out"
  alarm_actions     = [aws_autoscaling_policy.cpu_scale_out.arn]
}



resource "aws_cloudwatch_metric_alarm" "cpu_scale_in" {
  alarm_name          = "${var.project_name}-${var.environment}-cpu-scale-in"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "40"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ec2-webserver.name
  }

  alarm_description = "Metric alarm for cpu scale in"
  alarm_actions     = [aws_autoscaling_policy.cpu_scale_in.arn]
}


resource "aws_autoscaling_policy" "mem_scale_out" {
  name                      = "${var.project_name}-${var.environment}-mem-scale-out"
  policy_type               = "StepScaling"
  adjustment_type           = "PercentChangeInCapacity"
  estimated_instance_warmup = 120
  autoscaling_group_name    = aws_autoscaling_group.ec2-webserver.name

  step_adjustment {
    scaling_adjustment          = 10
    metric_interval_lower_bound = 0
    metric_interval_upper_bound = 10

  }
  step_adjustment {
    scaling_adjustment          = 20
    metric_interval_lower_bound = 10
    metric_interval_upper_bound = null

  }
}

resource "aws_autoscaling_policy" "mem_scale_in" {
  name                      = "${var.project_name}-${var.environment}-mem-scale-in"
  policy_type               = "StepScaling"
  adjustment_type           = "PercentChangeInCapacity"
  estimated_instance_warmup = 120
  autoscaling_group_name    = aws_autoscaling_group.ec2-webserver.name

  step_adjustment {
    scaling_adjustment          = -10
    metric_interval_lower_bound = -20
    metric_interval_upper_bound = 0

  }
  step_adjustment {
    scaling_adjustment          = -20
    metric_interval_upper_bound = -20
    metric_interval_lower_bound = null

  }
}


resource "aws_cloudwatch_metric_alarm" "mem_scale_out" {
  alarm_name          = "${var.project_name}-${var.environment}-mem-scale-out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "mem_used_percent"
  namespace           = var.metric_namespace
  period              = "120"
  statistic           = "Average"
  threshold           = "70"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ec2-webserver.name
  }

  alarm_description = "EC2 memory utilization metric to scale out"
  alarm_actions     = [aws_autoscaling_policy.mem_scale_out.arn]
}

resource "aws_cloudwatch_metric_alarm" "mem_scale_in" {
  alarm_name          = "${var.project_name}-${var.environment}-mem-scale-in"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "mem_used_percent"
  namespace           = var.metric_namespace
  period              = "120"
  statistic           = "Average"
  threshold           = "40"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ec2-webserver.name
  }

  alarm_description = "EC2 memory utilization metric to  scale in"
  alarm_actions     = [aws_autoscaling_policy.mem_scale_in.arn]
}
