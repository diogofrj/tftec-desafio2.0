# data "azurerm_subscription" "current" {}

# resource "azurerm_policy_definition" "example" {
#   name        = "only-deploy-in-westeurope"
#   policy_type = "Custom"
#   mode        = "All"

#   policy_rule = <<POLICY_RULE
#     {
#     "if": {
#       "not": {
#         "field": "location",
#         "equals": "westeurope"
#       }
#     },
#     "then": {
#       "effect": "Deny"
#     }
#   }
# POLICY_RULE
# }

# resource "azurerm_subscription_policy_assignment" "example" {
#   name                 = "example"
#   policy_definition_id = azurerm_policy_definition.example.id
#   subscription_id      = azurerm_subscription.current.id
# }


# data "azurerm_management_group" "mgmt-mct" {
#   display_name = "MCT"
# }

# resource "azurerm_policy_definition" "policy-allow-locations" {
#   name                = "Permit"
#   policy_type         = "Custom"
#   mode                = "All"
#   management_group_id = data.azurerm_management_group.mgmt-mct.group_id
#   display_name = "policy-permit-regions"
#   policy_rule = <<POLICY_RULE
#     {
#     "if": {
#       "not": {
#         "field": "location",
#         "in": [
#           "eastus",
#           "eastus2",
#           "centralus",
#           "global"
#           ]
#       }
#     },
#     "then": {
#       "effect": "Deny"
#     }
#   }
# POLICY_RULE
# }

# resource "azurerm_management_group_policy_assignment" "policy-allow-locations" {
#   name                 = "policy-permit-regions"
#   policy_definition_id = azurerm_policy_definition.policy-allow-locations.id
#   management_group_id  = data.azurerm_management_group.mgmt-mct.id
# }