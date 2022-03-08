output "primary_domain" {
  value = data.azuread_domains.primary_domain.domains.0.domain_name
}
output "secundary_domain" {
  value = data.azuread_domains.primary_domain.domains.3.domain_name
}

