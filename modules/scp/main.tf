resource "aws_organizations_policy" "this" {
  name    = local.scp_name
  content = file(var.json_scp)
}

resource "aws_organizations_policy_attachment" "this" {
  for_each  = toset(var.OUs)
  policy_id = aws_organizations_policy.this.id
  target_id = each.value
}

