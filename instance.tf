resource "aws_instance" "public_instance" {
  for_each               = toset(var.instancias)
  ami                    = var.ec2_spec.ami
  instance_type          = var.ec2_spec.instance_type
  subnet_id              = aws_subnet.publicsubnet.id
  key_name               = data.aws_key_pair.llave.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_public.id]
  user_data              = file("script.sh")
  tags = {
    "Name" = "${each.value}-${local.sufix}"
  }

}

resource "aws_instance" "monitoring_instance" {
  count = var.monitoreo ? 1:0
  ami                    = var.ec2_spec.ami
  instance_type          = var.ec2_spec.instance_type
  subnet_id              = aws_subnet.publicsubnet.id
  key_name               = data.aws_key_pair.llave.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_public.id]
  user_data              = file("script.sh")
  tags = {
    "Name" = "monitoreo-${local.sufix}"
  }

}
