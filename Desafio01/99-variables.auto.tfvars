countador = 1
rgname    = "RG-Desafio"
signame   = "sigdesafio"

network = {
  vnetnameus1 = "VNET01"
  snetnameus1 = "SUB01"

  vnetnameus2 = "VNET02"
  snetnameus2 = "SUB02"
}
network_prefix = {
  vnetprefixus1 = ["10.0.0.0/16"]
  snetprefixus1 = ["10.0.0.0/24"]

  vnetprefixus2 = ["10.1.0.0/16"]
  snetprefixus2 = ["10.1.0.0/24"]
}

nsgname   = "NSG01"
regionus2 = "centralus"
regionus1 = "eastus"

tags = {
  "tftec" = "Desafio"
}

tokendevops = "m2do376lkwvzvl26p2gis35linhmf2ntqtenlhd4me5ejtx4khla"
url_org     = "https://dev.azure.com/diogofernandesnet"