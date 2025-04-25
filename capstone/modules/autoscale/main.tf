resource "aws_launch_template" "capstone" {
  name          = "${var.project}-template"
  image_id      = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_group_id]


  iam_instance_profile {
    name = aws_iam_instance_profile.capstone.name
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project}-template"
    }
  }
}


resource "aws_autoscaling_group" "capstone" {
  name                      = "capstone"
  min_size                  = 1
  max_size                  = 3
  health_check_grace_period = 300
  desired_capacity          = 1
  vpc_zone_identifier       = [
    var.subnet_a_id,
    var.subnet_b_id
  ]

  launch_template {
    id      = aws_launch_template.capstone.id
    version = "$Latest"
  }
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.project}-webserver"
    propagate_at_launch = true
  }
}

resource "aws_iam_instance_profile" "capstone" {
  name = var.project
  role = aws_iam_role.capstone_role.name
}

resource "aws_iam_role" "capstone_role" {
  name               = "capstone_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_role_policy_attachment" "AmazonSSMManagedInstanceCore_attach" {
  policy_arn =  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       =  aws_iam_role.capstone_role.id
}
