resource "aws_placement_group" "test" {
  name     = var.name
  strategy = var.strategy
}
resource "aws_launch_configuration" "fooasg3" {
  name_prefix             = var.name_prefix
  image_id                = var.image_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  security_groups         = var.security_groups
  associate_public_ip_address = true
}
resource "aws_autoscaling_group" "test" {
  asg_name                  = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = true
  placement_group           = aws_placement_group.test.id
  launch_configuration      = aws_launch_configuration.fooasg3.name
  vpc_zone_identifier       = var.vpc_zone_identifier

  initial_lifecycle_hook {
    name                 = "test"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 2500
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

    notification_metadata = jsonencode({
      foo = "asg3"
    })

    notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
    role_arn                = "arn:aws:iam::123456789012:role/S3Access"
  }

  tag {
    key                 = "foo"
    value               = "asg3"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}
