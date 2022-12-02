variable "sg" {
  description ="security group to be attached to the instance"
}

variable "ami" {
  description= "desired ami id" 
}
variable "pub-id" {
    type = map(object({
    subnet_id = string
    name = string
    })  )
}
variable "instance_type" {
  description = " desired instance type"
  type = string
  
 
}

variable "key-pair" {
  description = "name of the key to ssh into instance"
}

# variable "hostname" {
#   description = "enter the desired hostname"
#   type =string
# }