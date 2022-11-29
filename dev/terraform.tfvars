####### GLOBAL TAG VALUES #######
environment = "DEV"
buildby = "Tushar"

####### VPC DETAILS #######
cidr = "10.0.0.0/20"
nat_required = "false"
nat-pub-id = "s1"
pub-snet = {
    s1 = {
      cidr_block        = "10.0.0.0/23"
      availability_zone = "ap-south-1a"
    },
    s2 = {
      cidr_block        = "10.0.2.0/23"
      availability_zone = "ap-south-1b"
    }
    s3 = {
      cidr_block        = "10.0.4.0/22"
      availability_zone = "ap-south-1c" 
    }
  }
pri-snet = {
    ps1 = {
      cidr_block        = "10.0.8.0/23"
      availability_zone = "ap-south-1a"
    },
    ps2 = {
      cidr_block        = "10.0.10.0/23"
      availability_zone = "ap-south-1b"
    }
    ps3 = {
      cidr_block        = "10.0.12.0/22"
      availability_zone = "ap-south-1c" 
    }
  }

####### SECURITY GROUP DETAILS ######
sg_details = {
    "web-server" = {
      description = "httpd inbound"
      name        = "web-server"
      ingress_rules = [
        {
          cidr_blocks     = ["0.0.0.0/0"]
          from_port       = 80
          protocol        = "tcp"
          self            = null
          to_port         = 80
          security_groups = null
        },
        {
          cidr_blocks     = ["0.0.0.0/0"]
          from_port       = 22
          protocol        = "tcp"
          self            = null
          to_port         = 22
          security_groups = null
        }

      ]
    },
    "alb-sg" = {
      description = "httpd inbound"
      name        = "lb-sg"
      ingress_rules = [
        {
          cidr_blocks     = ["0.0.0.0/0"]
          from_port       = 80
          protocol        = "tcp"
          self            = null
          to_port         = 80
          security_groups = null
    }] }
  }

####### INSTANCE DETAILS ######
ami = "ami-062df10d14676e201"
instance_type = "t2.micro"
key-pair = "key-nv-pair"