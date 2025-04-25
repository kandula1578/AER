module "vpc" {
  source = "../modules/vpc"

  region        = var.region
  project       = var.project
  vpc_cidr      = "190.160.0.0/16"
  az_a = "us-east-1a"
  az_b = "us-east-1b"
  subnet_a_cidr = "190.160.1.0/26"
  subnet_b_cidr = "190.160.2.0/26"
}

module "security" {
  source = "../modules/security"

  project = var.project
  vpc_id = module.vpc.vpc_id
}

module "elb" {
  source  = "../modules/elb"
  project = var.project
  vpc_id = module.vpc.vpc_id

  subnet_a_id = module.vpc.subnet_a_id
  subnet_b_id = module.vpc.subnet_b_id

  security_group_id = module.security.security_group_id
}

module "autoscale" {
  source = "../modules/autoscale"

  region         = var.region
  project        = var.project
  startup_script = "capstone.sh"

  image_id = "ami-0b86aaed8ef90e45f"
  instance_type      = "t2.micro"
  instance_count_min = 1
  instance_count_max = 10
  add_public_ip      = true

  subnet_a_id = module.vpc.subnet_a_id
  subnet_b_id = module.vpc.subnet_b_id

  security_group_id = module.security.security_group_id

  load_balancer_id = module.elb.load_balancer_id
}

