variable "virginia_cidr" {
  description = "CIDR Virginia"
  type        = string
  sensitive   = false
}
/* variable "public_subnet" {
    description = "CIDR public Subnet"
    type = string
}
variable "private_subnet" {
    description = "CIDR private Subnet"
    type = string 
} */

variable "subnets" {
  description = "Lista de VPC"
  type        = list(string)
}

variable "tags" {
  description = "Etiqueta para los recursos"
  type        = map(string)
}
variable "cidr_security_group" {
  description = "cidr desde donde viene la conexion en el SG"
  type        = string

}
variable "ec2_spec" {
  description = "specs de la isntancia ec2"
  type        = map(string)

}

variable "instancias" {
  description = "Nombre de las instancias"
  type            = list(string)
}

  
variable "monitoreo" {
  type = bool
  description = "Despliega instancia de monitoreo"
  
}

variable "ports_sg" {
  type = list(number)  
}

variable "secret_key" {
}

variable "access_key" {
}
