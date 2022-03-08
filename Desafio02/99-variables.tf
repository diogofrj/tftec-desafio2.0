variable "DevOpsPAT" {}
variable "url_organization" {}
variable "rgname" {}
# variable "signame" {}
# variable "regionus1" {}
# variable "regionus2" {}

# variable "nsgname" {}

variable "tags" {
  description = "Tags do Desafio02"
  type        = map(string)
}

# variable "ARM_CLIENT_ID" {
# }
# variable "ARM_CLIENT_SECRET" {
# }
# variable "ARM_SUBSCRIPTION_ID" {
# }
# variable "ARM_TENANT_ID" {
# }



# variable "network" {
#   type = map(string)
# }
# variable "network_prefix" {
#   type = any
# }
# vnetnameus1   = string
# vnetprefixus1 = list(any)
# snetnameus1   = string
# snetprefixus1 = list(any)
# vnetnameus2   = string
# vnetprefixus2 = list(any)
# snetnameus2   = string
# snetprefixus2 = list(any)


variable "mandatory_tag_keys" {
  type        = list
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
    "Application",
    "CostCentre",
    "Environment",
    "ManagedBy",
    "OwnedBy",
    "SupportBy"
  ]
}