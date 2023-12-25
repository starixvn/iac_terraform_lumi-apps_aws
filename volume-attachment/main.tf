resource "aws_volume_attachment" "zabbix" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.zabbix.id
  instance_id = data.terraform_remote_state.iam.outputs.ec2_zabbix.id
}

resource "aws_ebs_volume" "zabbix" {
  availability_zone = var.availability_zone
  size              = 10
  tags = merge(
    local.common_tags,
    {
      Resource = "EBS"
    },
  )
}