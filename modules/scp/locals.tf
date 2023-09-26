locals {
  raw_file     = trimsuffix(var.json_scp, ".json")
  path_removed = trimprefix(local.raw_file, "policies/")
  scp_name     = replace(local.path_removed, "/s.*//", "")
}