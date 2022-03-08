# Create a user
resource "azuread_user" "svc_azure" {
  user_principal_name = "svc.azure@${data.azuread_domains.primary_domain.domains.2.domain_name}"
  display_name        = "Service Account AD Connect"
  password            = "Partiunuvem@123"
  country = "BR"
  
}

resource "azuread_directory_role" "global_adm_role" {
  display_name = "Global administrator"
}

resource "azuread_directory_role_member" "example" {
  role_object_id   = azuread_directory_role.global_adm_role.object_id
  member_object_id = azuread_user.svc_azure.object_id
}