output "autoscaling_group_id" {
  value = aws_autoscaling_group.test.id
}

output "launch_configuration_id" {
  value = aws_launch_configuration.fooasg3.id
}

output "placement_group_id" {
  value = aws_placement_group.test.id
}
