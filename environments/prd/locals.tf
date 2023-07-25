locals { 
 resourcegroups =["${var.kvtgroupname}", "${var.storageGroup}", "${var.sqlGroup}", "${var.cosmosdbResourceGroupName}", "${var.vmGroup}", "${var.sqlmiGroup}", "${var.elbGroup}", "${var.atmGroup}", "${var.cosmosdbGroup}", "${var.lbGroup}"]

 tags = {
    wk_cost_center      = "${var.costCenter}",
    wk_environment-tags = "${var.envType}"
    wk_division_code    = "${var.divisioncode}
    there are many i have noted only few   //all wk related tags applicable only in wk 
 }
 subnet_names = { 
   bke0 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "bke0"),
   bke1 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "bke1"),
   cre0 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "cre0"),
   cre1 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "cre1"),
   cre2 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "cre2"),
   cre3 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "cre3"),
   cre4 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "cre4"),
   dmz1 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "dmz1"),
   edg0 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "edg0"),
   dmz0 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"sub", var.envCode, "dmz0"),
 }

 nsg_names = {

    bke0 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"nsg", var.envCode, "bke0"),
    bke1 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"nsg", var.envCode, "bke0"), #bke1 subnet is assosiated with nsg bke0  
    cre0 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"nsg", var.envCode, "cre0"),
    cre1 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"nsg", var.envCode, "cre0")  #cre1 subnet is assosiated with nsg cre0 
 }
 rtb_names = { 
     bke0 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"rot", var.envCode, "bke0"),
     bke1 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"rot", var.envCode, "bke0"), bke1 subnet is assosiated with route table bke0
     cre0 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"rot", var.envCode, "cre0"),
     cre1 = format(%s-%s-%s-%s-%s-%s", var.regionCode, var.divisionCode,var.buCode,"rot", var.envCode, "cre0"), #cre1 subnet is assosiated with route table cre0 
 }

 key_vault_id                = format("/subscriptions/%s/ResourceGroups/%s/providers/Microsoft.KeyVault/%s", var.subscriptionId, var.kvtgroupname, var.keyvaults[0].keyvaultName)
 subnet_id_prefix            = format("/subscriptions/%s/ResourceGroups/%s/providers/Microsoft.Networks/%s/subnet/", var.subscriptionId, var.vnetGroup,var.vnetName)
 nsg_id_prefix               = Microsoft.Network/networkSecurityGroups //format should ne like the above as this is wk standard so just for refernce sake copied only 2  with full notation from 3rd hust giving important matter only //
 rtb_id_prefix               = Microsoft.Network/routeTables 
 elbName                     = "elb"
 elbName2                    = "elb2"
 elbName3                    = "elb", "01"
 elbName4                    = "elb", "02"
 backendpool_id_prefix       = Microsoft.Network/loadBalancers/%s/backendAddresspool 
 public_ip_address_id        = Microsoft.Network/publicIPAddresses/", var.elbGroup
 public_ip_address_id2       = Microsoft.Network/publicIPAddresses/", var.elbGroup
 backendpoolName             = "elb", "01", "be"
 backendpoolName2            = "elb", "02", "be"
 backendpoolName3            = "be", "01"
 backendpoolName4            = "be", "02"
 frontend_ip_name            = "frontendip1", "01"
 frontend_ip_name2           = "frontendip2", "02"
 frontend_ip_name3           = "fip", "01"
 frontend_ip_name4           = "fip", "02"
 sqlmi_name1                 = "qmi", "001"
 sqlmi_name2                 = "qmi", "002"
 sqlmi_name3                 = "qmi", "003"
 sqlmi_name4                 = "qmi", "004"
 keyvault_name               = "kvt", "1"
 redisName                   = "rch", "01"
 atmName                     = "atm", "sftp01"
 CassandradbAccountName      = "cdb", "01"
 Public_IP1                  = "pip", "01"
 Public_IP2                  = "pip", "02"
 Public_IP3                  = "pip", "03"
 Public_IP4                  = "pip", "04"
 Public_IP5                  = "pip", "05"
 Public_IP6                  = "pip", "06"
 Public_IP7                  = "pip", "07"
 Public_IP8                  = "pip", "08"
 Public_IP9                  = "pip", "09"
 Public_IP10                 = "pip", "10"

}