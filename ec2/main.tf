/* Proxy GW */
module "proxy_gw_linux" {
  source                 = "gitlab.nexdev.net/iac-terraform/ec2-instance/aws"
  version                = "5.2.1"
  for_each               = { for server in local.proxy_gw_instances : server.instance_name => server }
  instance_type          = each.value.instance_type
  name                   = lower("vn-${var.team}-${var.environment}-${each.key}")
  ami                    = data.aws_ami.os[each.value.ami].id
  subnet_id              = each.value.subnet_id
  #data.terraform_remote_state.vpc.outputs.private_subnets[0]
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.proxy_gw_sg]
  #[module.proxy_gw_sg.security_group_id]
  private_ip             = each.value.private_ip
  hibernation            = false
  enable_volume_tags = false
  root_block_device = [{
    volume_type           = each.value.volume_type
    volume_size           = each.value.volume_size
    delete_on_termination = false
    tags = merge(
      local.common_tags,
      {
        Name = lower("${var.team}-${var.environment}-${each.key}")
      },
    )
  }]
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 8
  }
  user_data = file("${path.module}/proxy_gw_prepare.sh")
  instance_tags = {
    OS = each.value.ami,
  }
  iam_instance_profile = data.terraform_remote_state.iam.outputs.ec2_iam_name
  tags = merge(
    local.common_tags,
    {
      Resource  = "EC2"
    },
  )
}

module "private_app_linux" {
  source                 = "gitlab.nexdev.net/iac-terraform/ec2-instance/aws"
  version                = "5.2.1"
  for_each               = { for server in local.apps_instances : server.instance_name => server }
  instance_type          = each.value.instance_type
  name                   = lower("vn-${var.team}-${var.environment}-${each.key}")
  ami                    = data.aws_ami.os[each.value.ami].id
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.private_db_sg,
    data.terraform_remote_state.sg.outputs.private_mon_sg,
    ]
  private_ip             = each.value.private_ip
  hibernation            = false
  enable_volume_tags = false
  root_block_device = [{
    volume_type           = each.value.volume_type
    volume_size           = each.value.volume_size
    delete_on_termination = false
    tags = merge(
      local.common_tags,
      {
        Name = lower("${var.team}-${var.environment}-${each.key}")
      },
    )
  }]
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 8
  }
  user_data = file("${path.module}/linux_prepare.sh")
  instance_tags = {
    OS = each.value.ami,
  }
  iam_instance_profile = data.terraform_remote_state.iam.outputs.ec2_iam_name
  tags = merge(
    local.common_tags,
    {
      Resource = each.value.tag
    },
  )
}

module "private_zabbix_linux" {
  source                 = "gitlab.nexdev.net/iac-terraform/ec2-instance/aws"
  version                = "5.2.1"
  for_each               = { for server in local.monitor_instances : server.instance_name => server }
  instance_type          = each.value.instance_type
  name                   = lower("vn-${var.team}-${var.environment}-${each.key}")
  ami                    = data.aws_ami.os[each.value.ami].id
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.private_mon_sg,
    ]
  private_ip             = each.value.private_ip
  hibernation            = false
  enable_volume_tags = false
  root_block_device = [{
    volume_type = "gp3"
    throughput  = 150
    volume_size = 8
    delete_on_termination = true
    tags = merge(
      local.common_tags,
      {
        Name = lower("${var.team}-${var.environment}-${each.key}")
      },
    )
  }]
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 8
  }
  user_data = file("${path.module}/linux_ssh_prepare.sh")
  instance_tags = {
    OS = each.value.ami,
  }
  tags = merge(
    local.common_tags,
    {
      Resource = "EC2"
    },
  )
}
