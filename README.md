# TFTEC - Desafio Azure 2.0
Repositório Terraform do Desafio Azure 2.0 - TFTEC


# Desafio 01
## 1ª Etapa
 - Configuração do ambiente On-premises
 - Desenho de arquitetura do projeto
 - Precificação do projeto
<br>

## Desenho Inicial

![alt](Desafio01/Desafio01.png) 


## Endereços para cópia dos VHDs:

```sh
VM-DC: azcopy copy https://stodiskdesafio.blob.core.windows.net/vhds/vm-dc.vhd "https://dfs76ddesafio02.blob.core.windows.net/vhd?sv=2018-11-09&sr=c&st=2022-03-03&se=2022-03-30&sp=racwl&spr=https&rscc=max-age%3D5&rscd=inline&rsce=deflate&rscl=en-US&rsct=application%2Fjson&sig=nEizsImjbPdjWfjP1DN42VJF7duFTv%2BGExwH%2Fsvzbgo%3D"
VM-SQL: azcopy copy https://stodiskdesafio.blob.core.windows.net/vhds/vmsqlserver.vhd "https://dfs76ddesafio01.blob.core.windows.net/vhd?sp=racwl&st=2022-03-04T16:41:13Z&se=2022-03-25T00:41:13Z&spr=https&sv=2020-08-04&sr=c&sig=JRodEGqfUaxs%2BFLQEnkczHDONsaMxnlZx7hoh%2FjuSUs%3D"
VM-PORTAL: https://stodiskdesafio.blob.core.windows.net/vhds/vm-portal.vhd "https://dfs76ddesafio01.blob.core.windows.net/vhd?sv=2018-11-09&sr=c&st=2022-03-03&se=2022-03-30&sp=racwl&spr=https&rscc=max-age%3D5&rscd=inline&rsce=deflate&rscl=en-US&rsct=application%2Fjson&sig=KCm9bl5xkEdJoVejcfQ4BSzPSm657Ctpq2Z4NZ2q07M%3D"
VM-HELP: https://stodiskdesafio.blob.core.windows.net/vhds/vm-helpdesk.vhd "https://dfs76ddesafio02.blob.core.windows.net/vhd?sv=2018-11-09&sr=c&st=2022-03-03&se=2022-03-30&sp=racwl&spr=https&rscc=max-age%3D5&rscd=inline&rsce=deflate&rscl=en-US&rsct=application%2Fjson&sig=nEizsImjbPdjWfjP1DN42VJF7duFTv%2BGExwH%2Fsvzbgo%3D"

```

### Exemplo de comando para cópia:
- azcopy copy https://disksvhdteste.blob.core.windows.net/disk/sql2.vhd "URL do seu Token SAS do Blob"


### Login VMs:
- Usuário: azadmin
- Senha: Partiunuvem@123 (P maiúsculo)


### Criação das VMs atraves das NICs e Discos Gerenciasdos:

```sh
az vm create -n "VM-DC" -g "RG-Desafio" --location "centralus" --attach-os-disk "VM-DC-OSDisk" --nics "VM-DC-nic" --size "Standard_E2as_v5" --os-type "windows" --boot-diagnostics-storage "dfs76ddesafio02" --license-type "Windows_Server" --tags "tftec=Desafio"
az vm create -n "VM-HELP" -g "RG-Desafio" --location "centralus" --attach-os-disk "VM-HELP-OSDisk" --nics "VM-HELP-nic" --size "Standard_E2as_v5" --os-type "Linux" --boot-diagnostics-storage "dfs76ddesafio02" --tags "tftec=Desafio"

az vm create -n "VM-SQL" -g "RG-Desafio" --location "eastus" --attach-os-disk "VM-SQL-OSDisk" --nics "VM-SQL-nic" --size "Standard_E2as_v5" --os-type "Windows" --boot-diagnostics-storage "dfs76ddesafio01"  --license-type "Windows_Server" --tags "tftec=Desafio"
az vm create -n "VM-PORTAL" -g "RG-Desafio" --location "eastus" --attach-os-disk "VM-PORTAL-OSDisk" --nics "VM-PORTAL-nic" --size "Standard_E2as_v5" --os-type "Windows" --boot-diagnostics-storage "dfs76ddesafio01"  --license-type "Windows_Server" --tags "tftec=Desafio"
```

## Evidência Arquitetura 

![alt](Desafio01/Evidência_Arquitetura.png)


## Observações

O Terraform não suportou a criação das VMs criando o disco diretamente do VHD utilizando o `resource` antigo `azurerm_virtual_machine` ja que as maquinas originais foram criadas em Hyper-V geração 2.
Portanto todo o codigo preparou o ambiente e as maquinas foram criadas via Azure CLI.