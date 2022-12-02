module "vm" {
  source = "../tf_modules/vm"
  sg = lookup(module.sg.output-sg-id, "web-server", null)
  ami = var.ami
  instance_type = var.instance_type
  key-pair = var.key-pair
  pub-id = {
    ec2-01= {
      subnet_id = lookup(module.vpc.pub-snet-id, "s1", null)
      name = "server-1"
      }
    ec2-02 = {
    subnet_id = lookup(module.vpc.pub-snet-id, "s2", null)
    name = "server-2"
    }
    ec2-03 = {
    subnet_id = lookup(module.vpc.pub-snet-id, "s3", null)
    name = "server-3"
    }
  }  
}

# module "vm" {
#   source = "../tf_modules/vm"
#   for_each = var.instance
#   sg = lookup(module.sg.output-sg-id, "web-server", null)
#   ami = var.ami
#   instance_type = var.instance_type
#   key-pair = var.key-pair
#   pub-id = lookup(module.vpc.pub-snet-id, "${each.value}", null)
# }
