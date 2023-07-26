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
 pip_zones                   = ["1", "2", "3"]
 quota                       = 5
 exclude_blob_properties     = "SMB"
 fileshare                   = []
 sqlmi_ad_admin_object_id    = null 
 sqlmi_failover_group_name   = "" 
 sqlmi_primary_instance_location = ""
 sqlmi_primary_instance_id   = ""
 sqlmi_ad_admin_username     = ""

 storages = [
    {
      storageName            = "use1sta${var.envCode}${var.appcodepp}"
      containers             = []# pass list of containers to create multiple in same storage 
      ReplicationType        = "${var.storageReplicatioType}"
      storageAccountTier     = "${var.storageAccountTier}"
      subresourcenames       = ["file"]
      sub_type               = "file"
      allow_nested_items_to_be_public = false 
      blob_cors_rule         = []
      fileshare              = "${local.fileshare}"
      quota                  = "${local.quota}"
      exclude_blob_properties = "${local.exclude_blob_properties}"
      enabled_protocol        = "${local.enabled_protocol}"
    },
    
    {
      storageName            = "use1sta${var.envCode}${var.appcodecp}"
      containers             = []# pass list of containers to create multiple in same storage 
      ReplicationType        = "${var.storageReplicatioType}"
      storageAccountTier     = "${var.storageAccountTier}"
      subresourcenames       = ["file"]
      sub_type               = "file"
      allow_nested_items_to_be_public = false 
      blob_cors_rule         = []
      fileshare              = "${local.fileshare}"
      quota                  = "${local.quota}"
      exclude_blob_properties = "${local.exclude_blob_properties}"
      enabled_protocol        = "${local.enabled_protocol}" 
    },
    {  
      storageName            = "use1sta${var.envCode}${var.appcodepp}2"
      containers             = []# pass list of containers to create multiple in same storage 
      ReplicationType        = "${var.storageReplicatioType}"
      storageAccountTier     = "${var.storageAccountTier}"
      subresourcenames       = ["file"]
      sub_type               = "file"
      allow_nested_items_to_be_public = false 
      blob_cors_rule         = []
      fileshare              = "${local.fileshare}"
      quota                  = "${local.quota}"
      exclude_blob_properties = "${local.exclude_blob_properties}"
      enabled_protocol        = "${local.enabled_protocol}"
    }
 ]

 sql_server = [
   {
     mssql_server_name          = format{"%s-%s-%s-%s-%s, var.regionCode, var.divisionCode, var.buCode, "qep", var.envCode, var.appCodepp}
     resource_group_name        = "${var.sqlGroup}"
     location                   = "${var.region}"
     mssql_server_version       = "12.0"
     pool_min_capacity          = "${var.pool_min_capacity}"
     pool_max_capacity          = "${var.pool_max_capacity}" 
     mssql_server_admin_login   = "mssqladmin1"
     key_vault_id               = local.key_vault_id
    
     mssql_server_azuread_admin = [{
     
       azuread_only            = false 
       object_id               = "8c43e5e-64fb-47fd-b8e4-4370832bdeab"
       username                = "NA_S_GBS_SQL_ELM"
     }] 
    db_collation               = "SQL_Latin1_General_CP1_CI_AS"
    pool_max_size_gb           = "${var.pool_max_size_gb}"
    pool_sku                   = "${var.pool_sku}"
    pool_zone_redundant        = false 
    elastic_pool_name          = format("%s-%s-%s-%s-%s, var.regionCode, var.divisionCode, var.buCode, "ep", var.envCode, var.appCodepp)
    subnet_id                  = "${local.subnet_id_prefix}${local.subnet_names.cre0}"
   }
 ]

 load_balancer = [
    {
      name                      = "${local.elbName}"
      resource_group_name       = "${var.elbGroup}"
      location                  = "${var.region}"
      type                      = "${var.elb_type}"
      sku                       = "Standard"
      sku_tier                  = "Regional"
      frontend_ip_configuration_name ="${local.frontend_ip_name}"
      zones                     = ["1"]
      public_ip_address_id      = "${local.public_ip_address_id}${local.elbName}"
      subnet_id                 = "${local.subnet_id_prefix}${local.subnet_names.edg0}"
      backendpools = [
        {
             name  = "${local.backendpoolName}"
        },
      ]
    },
    {
      name                      = "${local.elbName2}"
      resource_group_name       = "${var.elbGroup}"
      location                  = "${var.region}"
      type                      = "${var.elb_type}"
      sku                       = "Standard"
      sku_tier                  = "Regional"
      frontend_ip_configuration_name ="${local.frontend_ip_name2}"
      zones                     = ["2"]
      public_ip_address_id      = "${local.public_ip_address_id}${local.elbName2}"
      subnet_id                 = "${local.subnet_id_prefix}${local.subnet_names.edg0}"
      backendpools = [
        {
             name  = "${local.backendpoolName2}"
        },
      ]
    },
    {
      {
      name                      = "${local.elbName3}"
      resource_group_name       = "${var.elbGroup}"
      location                  = "${var.region}"
      type                      = "${var.elb_type}"
      sku                       = "Standard"
      sku_tier                  = "Regional"
      frontend_ip_configuration_name ="${local.frontend_ip_name3}"
      zones                     = ["1"]
      public_ip_address_id      = "${local.public_ip_address_id}${local.elbName3}"
      subnet_id                 = "${local.subnet_id_prefix}${local.subnet_names.edg0}"
      backendpools = [
        {
             name  = "${local.backendpoolName}"
        },
      ]
    },
    
    {
      name                      = "${local.elbName4}"
      resource_group_name       = "${var.elbGroup}"
      location                  = "${var.region}"
      type                      = "${var.elb_type}"
      sku                       = "Standard"
      sku_tier                  = "Regional"
      frontend_ip_configuration_name ="${local.frontend_ip_name4}"
      zones                     = ["1"]
      public_ip_address_id      = "${local.public_ip_address_id}${local.elbName4}"
      subnet_id                 = "${local.subnet_id_prefix}${local.subnet_names.edg0}"
      backendpools = [
        {
             name  = "${local.backendpoolName4}"
        },
      ]
    }
 ]

publicip = [
    {
      name                  = "${local.Public_Ip1}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip1}"
      zones                 = "${local.pip.zones}"  
    },
    {
      name                  = "${local.Public_Ip2}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip2}"
      zones                 = "${local.pip.zones}" 
    }
    {
      name                  = "${local.Public_Ip3}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip3}"
      zones                 = "${local.pip.zones}" 
    },
    {
      name                  = "${local.Public_Ip4}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip4}"
      zones                 = "${local.pip.zones}" 
    },
    {
      name                  = "${local.Public_Ip5}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip5}"
      zones                 = "${local.pip.zones}" 
    },
    {
      name                  = "${local.Public_Ip6}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip6}"
      zones                 = "${local.pip.zones}" 
    },
    {
      name                  = "${local.Public_Ip7}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip7}"
      zones                 = "${local.pip.zones}" 
    },
    {
      name                  = "${local.Public_Ip8}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip8}"
      zones                 = "${local.pip.zones}" 
    },
    {
      name                  = "${local.Public_Ip9}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip9}"
      zones                 = "${local.pip.zones}" 
    },
    {
      name                  = "${local.Public_Ip10}"
      resource_group_name   = "${local.pipGroup}"
      location              = "${var.region}"
      allocation_method     = "${local.pip_allocation_method}"
      sku                   = "${var.pip.sku}"
      sku_tier              = "${var.pip_sku_tier}"
      domain_name_label     = "${local.public_Ip10}"
      zones                 = "${local.pip.zones}" 
    }
]
sqlmi = [
  
  {
     network_security_group_name = local.nsg_names.cre0
     route_table_name            = local.rtb_names.cre0
     kv_name                     = "${local.keyvault_name}"
     kv_resource_group_name      = "${var.kvtgroupname}"
     name                        = "${local.sqlmi_name1}"
     resource_group_name         = "${var.sqlmiGroup}"
     location                    = "${var.region}"
     sku_name                    = "GP_Gen5"
     vcores                      = "32"
     storage_size_in_gb          = "${var.licemse_type}"
     admin_login                 = "${var.adminLogin}"
     subnet_id                   = "${local.subnet_id_prefix}${local.subnet_names.cre1}"
     region_pair                 = "${var.pairedregion}"
     subnetiprange               = "${var.subnetiprange_01}"
     subscription_id             = "${var.subscription_Id}"
     skip_nsg_rtb                = false 
     public_data_sqlmi           = false  
     sqlmi_ad_admin_object_id    = null
     sqlmi_failover_group_name   = "${local.sqlmi_failover_group_name}"
     sqlmi_primary_instance_location = "${local.sqlmi_primary_instance_location}"
     sqlmi_primary_instance_id   = "${local.sqlmi_primary_instance_id}"
     sqlmi_ad_admin_username     = "${local.sqlmi_ad_admin_username}"
  },
    {
     network_security_group_name = local.nsg_names.cre0
     route_table_name            = local.rtb_names.cre0
     kv_name                     = "${local.keyvault_name}"
     kv_resource_group_name      = "${var.kvtgroupname}"
     name                        = "${local.sqlmi_name2}"
     resource_group_name         = "${var.sqlmiGroup}"
     location                    = "${var.region}"
     sku_name                    = "GP_Gen5"
     vcores                      = "32"
     storage_size_in_gb          = "${var.licemse_type}"
     admin_login                 = "${var.adminLogin}"
     subnet_id                   = "${local.subnet_id_prefix}${local.subnet_names.cre2}"
     region_pair                 = "${var.pairedregion}"
     subnetiprange               = "${var.subnetiprange_02}"
     subscription_id             = "${var.subscription_Id}"
     skip_nsg_rtb                = false 
     public_data_sqlmi           = false  
     sqlmi_ad_admin_object_id    = null
     sqlmi_failover_group_name   = "${local.sqlmi_failover_group_name}"
     sqlmi_primary_instance_location = "${local.sqlmi_primary_instance_location}"
     sqlmi_primary_instance_id   = "${local.sqlmi_primary_instance_id}"
     sqlmi_ad_admin_username     = "${local.sqlmi_ad_admin_username}"
    },
    {
     network_security_group_name = local.nsg_names.cre0
     route_table_name            = local.rtb_names.cre0
     kv_name                     = "${local.keyvault_name}"
     kv_resource_group_name      = "${var.kvtgroupname}"
     name                        = "${local.sqlmi_name3}"
     resource_group_name         = "${var.sqlmiGroup}"
     location                    = "${var.region}"
     sku_name                    = "GP_Gen5"
     vcores                      = "32"
     storage_size_in_gb          = "${var.licemse_type}"
     admin_login                 = "${var.adminLogin}"
     subnet_id                   = "${local.subnet_id_prefix}${local.subnet_names.cre3}"
     region_pair                 = "${var.pairedregion}"
     subnetiprange               = "${var.subnetiprange_03}"
     subscription_id             = "${var.subscription_Id}"
     skip_nsg_rtb                = false 
     public_data_sqlmi           = false  
     sqlmi_ad_admin_object_id    = null
     sqlmi_failover_group_name   = "${local.sqlmi_failover_group_name}"
     sqlmi_primary_instance_location = "${local.sqlmi_primary_instance_location}"
     sqlmi_primary_instance_id   = "${local.sqlmi_primary_instance_id}"
     sqlmi_ad_admin_username     = "${local.sqlmi_ad_admin_username}"
    },
    {
          network_security_group_name = local.nsg_names.cre0
     route_table_name            = local.rtb_names.cre0
     kv_name                     = "${local.keyvault_name}"
     kv_resource_group_name      = "${var.kvtgroupname}"
     name                        = "${local.sqlmi_name4}"
     resource_group_name         = "${var.sqlmiGroup}"
     location                    = "${var.region}"
     sku_name                    = "GP_Gen5"
     vcores                      = "32"
     storage_size_in_gb          = "${var.licemse_type}"
     admin_login                 = "${var.adminLogin}"
     subnet_id                   = "${local.subnet_id_prefix}${local.subnet_names.cre4}"
     region_pair                 = "${var.pairedregion}"
     subnetiprange               = "${var.subnetiprange_04}"
     subscription_id             = "${var.subscription_Id}"
     skip_nsg_rtb                = false 
     public_data_sqlmi           = false  
     sqlmi_ad_admin_object_id    = null
     sqlmi_failover_group_name   = "${local.sqlmi_failover_group_name}"
     sqlmi_primary_instance_location = "${local.sqlmi_primary_instance_location}"
     sqlmi_primary_instance_id   = "${local.sqlmi_primary_instance_id}"
     sqlmi_ad_admin_username     = "${local.sqlmi_ad_admin_username}"
    }
]

atm = [
  {
    atmName                       = "${local.atmName}"
    atmresource_group_name        = "${var.atmGroup}"
    atmprotocol                   = "${var.atmprotocol}"
    atmport                       = "${var.atm_port}"
    atmtraffic_routing_method     = "${var.atmtraffic_routing_method}"
  }
]

rediscache = [
  {
     redisName                    = "${local.redisName}"
     location                     = "${var.region}"
     RedisGroup                   = "${var.redisGroup}"
     redisSkuname                 = "${var.redis_skuName}"
     redisSkufamily               = "${var.redis_family}"
     redisSkucapacity             = "${var.redis_capacity}"
     rchsubnetiprange             = "${var.rchsubnetiprange}"
     clientsubnetiprange          = "${var.clientsubnetiprange}"
     subnet_id                    = "${local.subnet_id_prefix}${local.subnet_names.bke1}"
     nsg_names                    = local.nsg_names.bke0
     rtb_names                    = local.rtb_names.bke0
     vnetGroup                    = "${var.vnetGroup}"
     redis_zones                  = "${var.redis_zones}"
     key_vault_id                 = "${local.key_vault_id}"
     enable_pvt_endpoint          = "${var.enable_pvt_endpoint}"
  }
]

cosmos_cassandradb_account = [
  {
    CassandradbAccountName        = "${local.CassandradbAccountName}"
    resource_group_name           = "{var.cosmosdbGroup}"
    kind                          = "{var.cassandra_kind}"
    location                      = "{var.region}"
    sub_type                      = "${var.cassandra_sub_type}"
    subnet_names                  = "${local.subnet_id_prefix}${local.subnet_names.bke0}"
    CassandraAccountCapabilities  = "${var.CassandraAccountCapabilities}"
  }
]  
mgd_ids = [
 {
    managed_identity_name           = "${var.division}-${var.busineesUnit}-${var.appcodepp}-${var.appcodecp}-${var.continent}-cert-manager-${var.envCode}-mi"
    resource_group_name             = "MC_${var.regionCode}-${var.divisionCode}-${var.buCode}-$rgp-${var.envCode}-${var.appCodepp}${var.appCodecp}-aks_${var.regionCode}-${var.divisionCode}-${var.buCode}-aks-$${var.envCode}-${var.appCodepp}${var.appCodecp}_${var.region}"
 },
 {
    managed_identity_name           = "${var.division}-${var.busineesUnit}-${var.appcodepp}-${var.appcodecp}-${var.continent}-thanos-${var.envCode}-mi"
    resource_group_name             = "MC_${var.regionCode}-${var.divisionCode}-${var.buCode}-$rgp-${var.envCode}-${var.appCodepp}${var.appCodecp}-aks_${var.regionCode}-${var.divisionCode}-${var.buCode}-aks-$${var.envCode}-${var.appCodepp}${var.appCodecp}_${var.region}"
 },
 {
    managed_identity_name           = "${var.division}-${var.busineesUnit}-${var.appcodepp}-${var.appcodecp}-${var.continent}-services-${var.envCode}-mi"
    resource_group_name             = "MC_${var.regionCode}-${var.divisionCode}-${var.buCode}-$rgp-${var.envCode}-${var.appCodepp}${var.appCodecp}-aks_${var.regionCode}-${var.divisionCode}-${var.buCode}-aks-$${var.envCode}-${var.appCodepp}${var.appCodecp}_${var.region}"
 }  
]    
  acrName  = "S{var.regionCode}${var.division}acr${var.envCode}${var.appCodepp}${var.appCodecp}"
  
  role_assignments = [ # generic set of rbac role role assignments
    {
     role_definition_name  = "AcrPush"
     scope                 = data.azurerm_container_registry.acr.id
     principal_ids         = ["$(var.ppcpSpn)"] # grc-elm-azdo=ppcp-spn 
    }
    {
      role_definition_name = "StorageBlob Data Reader"
      scope                = module.storageaccounts["use1sta${var.envCode}${var.appCodecp}"].storage_id
      principal_ids        = [module.managed_identities["${var.division}-${var.businessUnit}-${var.appCodepp}${var.appCodecp}-${var.continent}-services-${var.envCode}-mi"].principal_id]
    },
  ]
  

