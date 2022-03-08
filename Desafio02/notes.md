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
