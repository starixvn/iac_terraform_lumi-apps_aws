module "private_app_linux" {
  source = "gitlab.nexdev.net/iac-terraform/ec2-instance/aws"
  version = "5.1.0"
  for_each = {for server in local.apps_instances: server.instance_name =>  server}
  instance_type = each.value.instance_type
  name = "${local.project}-${var.environment}-${each.key}"
  ami           = data.aws_ami.os[each.value.ami].id
  subnet_id              = data.terraform_remote_state.vpc.outputs.private_subnets[0]
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.private_web_sg]
  root_block_device = [{
  volume_type = each.value.volume_type
  volume_size = each.value.volume_size
  delete_on_termination = true
  }]
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 8
  }
  user_data      = file("${path.module}/linux_prepare.sh")
  tags = local.common_tags
}
