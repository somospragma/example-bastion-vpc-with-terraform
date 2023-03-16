variable "minimum_instances" {
  description = "The minimum number of bastion instances."
  type = number
  default = 1
}

variable "instance_type" {
  description = "The instance type of the bastion instances."
  type = string
  default = "t2.micro"
}

variable "maximum_instances" {
  description = "The maximum number of bastion instances."
  type = number
  default = 1
}

variable "desired_instances" {
  description = "The desired number of bastion instances."
  type = number
  default = 1
}

variable "availability_zone" {
  description = "availability zone."
  type = string
  default = "us-east-1"
}

variable "sub_network_mask" {
  description = "Sub network mask."
  type = string
  default = "20"
}

variable "vpc_name" {
  description = "Vpc name."
  type = string
  default = "ipv6_vpc_terraform"
}

variable "vpc_ip" {
  description = "Vpc ip."
  type = string
  default = "10.16.0.0"
}

variable "vpc_mask" {
  description = "Vpc mask."
  type = string
  default = "16"
}

variable "sub_networks" {
   type = map
   default = {
      sub-1 = {
         cidrNumber= 1       
         tagName = "sn_reserved_A"
         zone = "a"
         ip = "10.16.0.0"
      }
      sub-2 = {
         cidrNumber= 2    
         tagName = "sn_db_A"
         zone = "a"
         ip = "10.16.16.0"
      }
      sub-3 = {
         cidrNumber = 3  
         tagName = "sn_app_A"
         zone = "a"
         ip = "10.16.32.0"
      }
      sub-4 = {
         cidrNumber= 4 
         tagName = "sn_web_A"
         zone = "a"
         ip = "10.16.48.0"
      }
      sub-5 = {
         cidrNumber= 5  
         tagName = "sn_reserved_B"
         zone = "b"
         ip = "10.16.64.0"
      }
      sub-6 = {
         cidrNumber= 6 
         tagName = "sn_db_B"
         zone = "b"
         ip = "10.16.80.0"
      }
      sub-7 = {
         cidrNumber= 7  
         tagName = "sn_app_B"
         zone = "b"
         ip = "10.16.96.0"
      }
      sub-8 = {
         cidrNumber= 8 
         tagName = "sn_web_B"
         zone = "b"
         ip = "10.16.112.0"
      }
      sub-9 = {
         cidrNumber= 9  
         tagName = "sn_reserved_C"
         zone = "c"
         ip = "10.16.128.0"
      }
      sub-10 = {
         cidrNumber= 10 
         tagName = "sn_db_C"
         zone = "c"
         ip = "10.16.144.0"
      }
      sub-11 = {
         cidrNumber= 11  
         tagName = "sn_app_C"
         zone = "c"
         ip = "10.16.160.0"
      }
      sub-12 = {
         cidrNumber= 12 
         tagName = "sn_web_C"
         zone = "c"
         ip = "10.16.176.0"
      }
   }
}



