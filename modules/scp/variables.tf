variable "OUs" {
  description = "list of AWS organizational units"
  type        = list(string)
}

variable "json_scp" {
  description = "json file containing SCP content"
  type        = string
}