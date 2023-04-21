name     = "test"
strategy = "cluster"
name_prefix             = "fooasg3-terraform-test-lc"
image_id                = "ami-00c39f71452c08778"
instance_type           = "t2.micro"
key_name                = "test-key"
security_groups         = ["sg-063c8f999a87e9063"]

asg_name                      = "fooasg3-terraform-test"
max_size                  = 5
min_size                  = 2
health_check_grace_period = 300
health_check_type         = "ELB"
desired_capacity          = 4
vpc_zone_identifier       = ["subnet-0c95f32ef3dfcf982","subnet-09067a854bf2caeb1"]

