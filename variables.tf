variable "sgname" {
  description = "This is development security group"
  default     = "dev-seg"
}

variable "cidr" {
  description = "This is dvelopment subnet cidr rule"
  default     = ["0.0.0.0/0"]
}

variable "subnets_cidr" {
  type    = list(any)
  default = ["10.0.1.0/24"]
}