regionCode  = "#{regionCode}#"
division    = "#{division}#"
divisionCode = "#{divisionCode}#"
businessUnit  = "#{busineesUnit}#"
buCode        = "#{buCode}"
envCode       = "#{envCode}"
envType       = "#{envType}"
envString     = "#{envString}"
appCodepp     = "#{appCodepp}"
appcodecp     = "#{appcodecp}"
appNamepp     = "#{appNamepp}"
appNamecp     = "#{appNamecp}"
applicationId = "#{applicationId}"
infraSupportGroup = "#{infraSupportGroup}" 
appSupportGroup = "#{appSupportGroup}" 
costCenter = "US20100153" 
subscriptionId = "#{subscriptionId}" 
region = "#{region}" 
continent = "#{continent}" 
vnetName = "#{regionCode}#-#{divisionCode}#-#{buCode}#-vnt-#{envCode}#-#{appCodepp}##{appCodecp}#2"

# Resource Groups 
vnetGroup       = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-network" 
kvtgroupname    = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-kvt"
storageGroup    = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-storage"
sqlmiGroup      = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-sqlmi"
sqlGroup        = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-sql"
vmGroup         = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-compute"
atmGroup        ="#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-atm"
elbGroup        = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-elb"
redisGroup      = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-redis"
aksGroup        = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-aks"
cosmosdbGroup   = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-cdb"
pipGroup        = "MC_zuse1_d003_b066_rgp_p1_ppcp_aks_zuse1_d003_b066_aks_p1_ppcp_eastus"
lbGroup         = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodepp}##{appCodecp}#-elb"

#Keyvault 
keyvaultSkuName        = "#{keyvaultSkuName}#"
purgeprotectionEnabled = true 
keyvaults  = [
  {
    keyvaultName = "#{regionCode}#-#{divisionCode}#-kvt-#{envCode}#-#{appCodepp}#1"
      accesspolicies  = [

        {
          object_id               =  "5cadb751-3f59-410-a7a3-cd9d1496c42"  # grc-ipm-devops-spn   enterprise application 
          certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", " Restore", "SetIssuers", Update", ]
          key_permissions         = ["Backup", "Create", "Delete", "Get", "Import", "List", "Recover", " Restore",  Update", ]
          secret_permissions      = ["Backup", "Delete", "Get", "List", "Recover", " Restore", "Set", "Purge", ]
          storage_permissions     = [] 
        },
        {
          object_id               =  "87bb6eba-7318-4e03-b166-a10de1601888"  # WK_GBS_IPM_GRC_AppOps_CloudAAD  -GRC-IPM Azure AD group
          certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", " Restore", "SetIssuers", Update", ]
          key_permissions         = ["Backup", "Create", "Delete", "Get", "Import", "List", "Recover", " Restore",  Update", ]
          secret_permissions      = ["Backup", "Delete", "Get", "List", "Recover", " Restore", "Set", "Purge", ]
          storage_permissions     = []   
        },
        {
          object_id               = "8c453e5e-64fb-47fd-b8e4-4370832bdeab" #NA_S_GBS_SQL_ELM 
          certificate_permissions = []
          key_permissions         = []
          secret_permissions      = ["Get", "List", ]
          storage_permissions     = [] 
        }
      ]  
},
{
  keyvaultName   = "#{regionCode}#-#{divisionCode}#-kvt-#{envCode}#-#{appCodecp}#1"
    accesspolicies  = [

        {
          object_id               =  "5cadb751-3f59-410-a7a3-cd9d1496c42"  # grc-ipm-devops-spn   enterprise application 
          certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", " Restore", "SetIssuers", Update", ]
          key_permissions         = ["Backup", "Create", "Delete", "Get", "Import", "List", "Recover", " Restore",  Update", ]
          secret_permissions      = ["Backup", "Delete", "Get", "List", "Recover", " Restore", "Set", "Purge", ]
          storage_permissions     = [] 
        },
        {
          object_id               =  "87bb6eba-7318-4e03-b166-a10de1601888"  # WK_GBS_IPM_GRC_AppOps_CloudAAD  -GRC-IPM Azure AD group
          certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", " Restore", "SetIssuers", Update", ]
          key_permissions         = ["Backup", "Create", "Delete", "Get", "Import", "List", "Recover", " Restore",  Update", ]
          secret_permissions      = ["Backup", "Delete", "Get", "List", "Recover", " Restore", "Set", "Purge", ]
          storage_permissions     = []   
        },
        {
          object_id               = "8c453e5e-64fb-47fd-b8e4-4370832bdeab" #NA_S_GBS_SQL_ELM 
          certificate_permissions = []
          key_permissions         = []
          secret_permissions      = ["Get", "List", ]
          storage_permissions     = [] 
        }
     ] 
    }
]

# Storage Account 
storageAccountTier     = "#{storageAccountTier}#" 
storageReplicationType = "#{storageReplicationType}#"

#SQL Elastic Server 
mssql_dbname           = ["#{appName}#1", "#{appName}#2", "#{appName}#3", "#{appName}#4", "#{appName}#5" ]
pool_min_capacity      = "#{database_min_capacity}#"
pool_max_capacity      = "#{database_max_capacity}#"
pool_max_size_gb       = "#{pool_max_size_gb}#"
pool_sku  = {
  name     = "#{mssql_pool_sku_name}#"
  tier     = "#{mssql_tier}#"
  family   = "#{mssql_family}#"
  capacity = "#{mssql_capacity}#"
}

# Cosmos DB 

cosmosdbResourceGroupName    = "#{regionCode}#-#{divisionCode}#-#{buCode}#-rgp-#{envCode}#-#{appCodecp}#-cdb"
mongodbAccountName           = "#{regionCode}#-#{division}#-cdb-mongo-#{envCode}#-#{appCodecp}#"
mongoVersion                 = "#{mongodbVersion}#"
mongoAccountCapabilities     = "#{mongodbVersion}#"  
cosmosdbFailoverLocations    = {
  primary = {
    location = "eastus"
    priority = 0 
  }
}
cosmosdbFailoverLocations_mongo   = {
  primary = {
    location = "eastus"
    priority = 0 
  }
}

#SQLMI Variables 
license_type   = "#{license_type}#"
adminLogin     = "#{adminLogin}#"
pairedregion   = "#{pairedregion}#"
subnetiprange_01 = "#{subnetiprange_01}#"
subnetiprange_02 = "#{subnetiprange_02}#"
subnetiprange_03 = "#{subnetiprange_03}#"
subnetiprange_04 = "#{subnetiprange_04}#"

#elb 
elb_type              = "public"
elb_allocation_method = "dynamic"

# Redis Cache 
rchsubnetiprange     = "#{rchsubnetiprange}#"
clientsubnetiprange  = ["#{rchsubnetiprange}#", "#{clientsubnetiprange}#"]
redis_skuName        = "#{redis_skuName}#"
redis_family         = "#{redis_family}#" 
redis_capacity       = "#{redis_capacity}#" 
enable_pvt_endpoint  = "#{enable_pvt_endpoint}#"

#Azure traffic manager 
atm_traffic_routing_method = "#{atm_traffic_routing_method}#"
atm_protocol               = "#{atm_protocol}#" 
atm_port                   = "#{atm_port}#" 

#SPN /MI objectIds 
ppcpSpn  = "#{ppcpSpn}#" 

#CosmosDB(Cassandra)
CassandraAccountCapabilities  = ["#{CassandraAccountCapabilities_01}#" , "#{CassandraAccountCapabilities_02}#"]
cassandra_sub_type            = "#{cassandra_sub_type}#"
cassandra_subresource_names   = ["#{cassandra_subresources_names}#"]
cassandra_kind                = "#{cassandra_kind}#"

#publicip 
pip_allocation_method        = "#{pip_allocation_method}#
pip_sku                      = "#{pip_sku}#"
pip_sku_tier                 = "#{pip_sku_tier}#"
