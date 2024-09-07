module "test_ec2" {
  source = "./modules/test_ec2"
}

module "nlb" {
  source = "./modules/nlb"
}