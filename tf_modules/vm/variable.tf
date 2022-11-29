variable "sg" {
  description ="security group to be attached to the instance"
}

variable "ami" {
  description= "desired ami id" 
}
variable "pub-id" {
    type = map(object({
    subnet_id = string
    })  )
}
variable "instance_type" {
  description = " desired instance type"
}
variable "key-pair" {
  description = "name of the key to ssh into instance"
}