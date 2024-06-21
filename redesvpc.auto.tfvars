virginia_cidr = "10.10.28.0/24"
/* public_subnet = "10.10.28.0/25"
private_subnet = "10.10.28.128/25"
 */
subnets = ["10.10.28.0/25", "10.10.28.128/25"]
tags = {
  "Env"         = "prueba"
  "name"        = "prueba2"
  "Owner"       = "Socrates"
  "IAC"         = "Terraform"
  "IAC_VERSION" = "1.8.4"
  "project"     = "cerberus"
  "region"      = "virginia"
}

cidr_security_group = "0.0.0.0/0"

ec2_spec = {
  "ami"           = "ami-00beae93a2d981137"
  "instance_type" = "t2.micro"
}

instancias = ["mysql", "jumpserver", "apache"]
monitoreo  = true

ports_sg = [22, 80, 443]
