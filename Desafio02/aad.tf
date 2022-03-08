# Create a user
resource "azuread_user" "svc_azure" {
  user_principal_name = "svc.azure@${data.azuread_domains.primary_domain.domains.2.domain_name}"
  display_name        = "Service Account AD Connect"
  password            = "Partiunuvem@123"
}