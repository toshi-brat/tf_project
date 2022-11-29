module "vpc" {
    source = "../tf_modules/networking" 
    cidr = var.cidr
    pub-snet = var.pub-snet
    pri-snet = var.pri-snet
    is_nat_required = var.nat_required
    nat-pub-id = var.nat-pub-id
    environment = local.environment
    buildby = local.buildby
}