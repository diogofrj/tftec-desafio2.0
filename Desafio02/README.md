## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.18.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | 0.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 2.98.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.18.0 |
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 0.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_directory_role.global_adm_role](https://registry.terraform.io/providers/hashicorp/azuread/2.18.0/docs/resources/directory_role) | resource |
| [azuread_directory_role_member.example](https://registry.terraform.io/providers/hashicorp/azuread/2.18.0/docs/resources/directory_role_member) | resource |
| [azuread_user.svc_azure](https://registry.terraform.io/providers/hashicorp/azuread/2.18.0/docs/resources/user) | resource |
| [azuredevops_project.project_tftec_desafio](https://registry.terraform.io/providers/microsoft/azuredevops/0.2.0/docs/resources/project) | resource |
| [azuread_domains.primary_domain](https://registry.terraform.io/providers/hashicorp/azuread/2.18.0/docs/data-sources/domains) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_DevOpsPAT"></a> [DevOpsPAT](#input\_DevOpsPAT) | n/a | `any` | n/a | yes |
| <a name="input_mandatory_tag_keys"></a> [mandatory\_tag\_keys](#input\_mandatory\_tag\_keys) | List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG' | `list` | <pre>[<br>  "Application",<br>  "CostCentre",<br>  "Environment",<br>  "ManagedBy",<br>  "OwnedBy",<br>  "SupportBy"<br>]</pre> | no |
| <a name="input_rgname"></a> [rgname](#input\_rgname) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags do Desafio02 | `map(string)` | n/a | yes |
| <a name="input_url_organization"></a> [url\_organization](#input\_url\_organization) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_primary_domain"></a> [primary\_domain](#output\_primary\_domain) | n/a |
| <a name="output_secundary_domain"></a> [secundary\_domain](#output\_secundary\_domain) | n/a |



---------------------------------------------------------------------------------------------------------------------------


--> Links

CAF: https://docs.microsoft.com/pt-br/azure/cloud-adoption-framework/
Landing Zone: https://docs.microsoft.com/pt-br/azure/cloud-adoption-framework/ready/landing-zone/
Taxonomia: https://docs.microsoft.com/pt-br/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming
Tags: https://docs.microsoft.com/pt-br/azure/cloud-adoption-framework/decision-guides/resource-tagging/

# echo > Desafio02/README.md && cat Desafio02/notes.md | tee Desafio02/README.md && tdocs && gpc && gpv
# cat Desafio02/notes.md | tee Desafio02/README.md && gpc && gpv

### Usuários:

usuário: `svc.azure` 
senha: `Partiunuvem@123`

usuário: `svc.adlocal`
senha: `Partiunuvem@123`

 

### Download Azure AD Connect
https://www.microsoft.com/en-us/download/details.aspx?id=47594
 
Comando para forçar a sincronização no Azure AD Connect:
```powershell
Start-ADSyncSyncCycle -PolicyType Delta
```



## Script para alterar sufixo dos usuários do AD:

```powershell
import-module activedirectory

#Old domain suffix
$oldSuffix = "tfteccompany.com.br"

#New domain suffix
$newSuffix = "diogofernandes.net"

#Specify the OU this script will target
$ou = “OU=Departamentos,DC=diogofernandes,DC=net”

#Specify a writeable domain controller
$server = “VM-DC-PRD”

Get-ADUser -SearchBase $ou -filter * | ForEach-Object {
$newUpn = $_.UserPrincipalName.Replace($oldSuffix,$newSuffix)
$_ | Set-ADUser -server $server -UserPrincipalName $newUpn
}
```