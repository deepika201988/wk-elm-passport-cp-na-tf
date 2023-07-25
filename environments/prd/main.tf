module "resourcegroups" {
   source   = "git@ssh.dev.azure.com:v3/GRC-IPM/terraform-modules//Azure//ResourceGroup?ref=v1.0.91"
   for_each = toset(local.resourcegroups)
   name     = each.key
   location = var.region
}
module "keyvaults" {
   source   = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//KeyVault?ref=v1.0.91"
   for_each = { for keyvault in var.keyvaults : keyvault.keyvaultName => keyvault }
   name     = each.value.keyvaultName

resource_group_name            = var.kvtgroupname
location                       = var.region 
access_policies                = each.value.access_policies
tenant_id                      = var.tenant_Id
sku_name                       = var.keyvaultSkuName
purge_protection_enabled       = var.purgeprotectionenabled
subnet_id                      = "${local.subnet_id_prefic}${local.subnet_names.bke0}"
private_endpoint               = var.private_endpoint
default_tags                   = local.tags 
depends_on = [
  module.resourcegroups
]
}


# storage Account resource creation
module "storageaccounts" {
  source                           = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//Storage?ref=v1.0.91"
  for_each                         = { for storage in local.storages : storage.storageName => storage }
  name                             = each.value.storageName
  containers                       = each.value.containers
  subnet_id                        = "${local.subnet_id_prefix}${local.subnet_names.cre0}"
  account_replication_type         = each.value.ReplicationType 
  account_tier                     = each.value.storageAccountTier
  subresource_names                = each.value.subresourcenames 
  allow_nested_items_to_be_public  = each.value.allow_nested_items_to_be_public 
  blob_cors_rule                   = each.value.blob_cors_rule 
  sub_type                         = each.value.sub_type 
  fileshare                        = each.value.fileshare 
  quota                            = each.value.quota 
  exclude_blob_properties          = each.value.exclude_blob_properties 
  enabled_protocol                 = each.value.enabled_protocol 
  location                         = var.region 
  resource_group_name              = var.storageGroup
  pvt_dns_zone_name                = null 
  dns_resource_group_name          = null 

  default_tags  = local.tags 
  
  depends_on = [
    module.resourcegroups
  ]
}

module "publicip" {
 source                             = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//PublicIP?ref=v1.0.91"
 for_each                           = { for public in local.publicip : public.name => public }
 name                               = each.value.name 
 location                           = each.value.location 
 resource_group_name                = each.value.resource_group_name 
 allocation_method                  = each.value.allocation_method 
 sku                                = each.value.sku 
 sku_tier                           = each.value.sku_tier 
 domain_name_label                  = each.value.domain_name_label 
 zones                              = each.value.zones 
 default_tags                       = local.tags 
 depends_on = [
   module.resourcegroups
 ]
}

#sql Elastic pool 
module "mssqlserver" {
  source                            = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/azurerm_mssql_elastic_pool?ref=v0.1.12"
  for_each                          = { for qep in local.sql_server : qep.mssql_server_name => qep }
  resource_group_name               = each.value.resource_group_name 
  mssql_server_name                 = each.value.mssql_server_name 
  mssql_dbname                      = var.mssql_dbname 
  elastic_pool_name                 = each.value.elastic_pool_name 
  mssql_server_version              = each.value.mssql_server_version 
  location                          = each.value.location 
  db_collation                      = each.value.db_collation 
  pool_min_capacity                 = each.value.pool_min_capacity 
  pool_max_capacity                 = each.value.pool_max_capacity 
  mssql_server_admin_login          = each.value.mssql_server_admin_login 
  mssql_server_azuread_admin        = each.value.mssql_server_azuread_admin 
  keyvault_id                       = each.value.keyvault_id 
  pool_max_size_gb                  = each.value.pool_max_size_gb 
  pool_zone_redundant               = each.value.pool_zone_redundant 
  pool_sku                          = each.value.pool_sku 
  subnet_id                         = each.value.subnet_id 
  default_tags                      = local.tags 
  depends_on = [
    module.resourcegroups
  ]
}

# CosmosDB (Mongo db) 
module "cosmos_mongodb_account" {
  source                            = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//CosmosDB?ref=v1.0.91"
  name                              = var.mongoAccountName 
  resource_group_name               = var.cosmos.dbResourceGroupName 
  kind                              = "MongoDB"
  location                          = var.region 
  sub_type                          = "cdb"   //Private endpoint subtype
  subnet_id                         = "${local.subnet_id_prefic}${local.subnet_names.cre0}" //subnetId for Private endpoint 
  subresource_names                 = ["MongoDB"]

  #Not mandatory 
  mongo_server_version              = var.mongodb.version 
  failover_locations                = var.cosmosdbFailoverLocation_mongo // the name of the azure region to host replicated data and their priority map(map(string))
  capabilities                      = var.mongoAccountCapabilities 

  default_tags = local.tags 

  depends_on = [
    module.resourcegroups
  ]
}

#external load balancer 
module "loadbalancer" {
  source  = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/azurerm_lb"

  for_each                          = { for load in local.load_balancer : load => load }
  name                              = each.value.name 
  location                          = each.value.location 
  resource_group_name               = each.value.resource_group_name 
  type                              = each.value.type 
  sku                               = each.value.sku 
  sku_tier                          = each.value.sku_tier 
  frontend_ip_configuration_name    = each.value.frontend_ip_configuration_name 
  zones                             = each.value.zones 
  public_ip_address_id              = each.value.public_ip_address_id 
  subnet_id                         = each.value.subnet_id 
  backendpools                      = each.value.backendpools
  default_tags                      = local.tags 

  depends_on = [
    module.resourcegroups
  ]
}

#azure traffic manager 
module "atm" {
  source                            = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//ATM?ref=v1.0.91"
  for_each                          = { for atm in local.atm : atm.atmName => atm }
  name                              = each.value.atmName
  relative_name                     = each.value.atmName 
  resource_group_name               = each.value.resource_group_name 
  protocol                          = each.value.protocol 
  port                              = each.value.atmport 
  traffic_routing_method            = each.value.atmtraffic_routing_method 
  default_tags                      = local.tags 
  depends_on = [
    module.resourcegroups
  ]
}


# Redis Cache 
module "redis" {
  source                            = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//RedisCache?ref=v1.0.92"
  for_each                          = { for redis in local.rediscache : redis.redisName => redis }
  redisName                         = each.value.redisName
  location                          = each.value.location 
  resourcegroup                     = each.value.RedisGroup 
  sku_name                          = each.value.sku_name 
  family                            = each.value.redisSkufamily
  capacity                          = each.value.redisSkucapacity 
  subnet_id                         = each.value.subnet_id 
  rchsubnetiprange                  = each.rchsubnetiprange 
  clientsubnetiprange               = each.value.clientsubnetiprange 
  nsg_name                          = each.value.nsg_names
  rtb_name                          = each.value.rtb_names 
  vnet_resource_group_name          = each.value.vnetGroup 
  zones                             = each.value.redis_zones
  key_vault_id                      = each.value.key_vault_id 
  enable_pvt_endpoint               = each.value.enable_pvt_endpoint 
  default_tags                      = local.tags 
}

# SQL MI 
module "sqlmippcp" {
  source                            = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//ManagedInstance?ref=v1.0.91"
  for_each                          = { for qmi in local.sqlmi : qmi.name => qmi }
  vnet_resource_group_name          = var.vnetGroup
  network_security_group_name       = each.value.network_security_group_name 
  route_table_name                  = each.value.route_table_name
  skip_nsg_rtb                      = each.value.skip_nsg_rtb
  kv_name                           = each.value.kv_name
  kv_resource_group_name            = each.value.kv_resource_group_name
  name                              = each.value.name 
  resource_group_name               = var.sqlmiGroup 
  location                          = each.value.location 
  sku_name                          = each.value.sku_name
  vcores                            = each.value.vcores
  storage_size_in_gb                = each.value.storage_size_in_gb 
  license_type                      = each.value.license_type
  admin_login                       = each.value.admin_login
  subnet_id                         = each.value.subnet_id
  region_pair                       = each.value.region_pair 
  subnetiprange                     = each.value.subnetiprange 
  public_data_endpoint_enabled      = each.value.public_data_sqlmi 
  subscription_id                   = var.subscriptionId
  sqlmi_ad_admin_object_id          = each.value.sqlmi_ad_admin_object_id 
  sqlmi_failover_group_name         = each.value.sqlmi_failover_group_name 
  sqlmi_primary_instance_location   = each.value.sqlmi_primary_instance_location
  sqlmi_primary_instance_id          = each.value.sqlmi_primary_instance_id
  sqlmi_ad_admin_username           = each.value.admin_login 
  default_tags                      = local.tags 

  depends_on = [
    module.resourcegroups,
    module.keyvaults
  ]
}

#cosmosDB (casandra db)
module "cosmos_casandradb_account" {
  source                            = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//CosmosDB?ref=v1.0.91"
  for_each                          = { for cdb-casandra in local.cosmos_casandradb_account : cdb-cassandra.CassandradbAccountName => cdb-cassandra }
  name                              = each.value.CassandradbAccountName
  resource_group_name               = each.value.resource_group_name
  kind                              = each.value.kind 
  location                          = each.value.location 
  sub_type                          = each.value.sub_type 
  subnet_id                         = each.value.subnet_id
  subresource_names                 = each.value.subresource_names
  capabilities                      = each.value.CassandraAccountCapabilities 
  failover_locations                = var.cosmosdbFailoverLocations 
  default_tags       = local.tags

  depends_on = [
    module.resourcegroups
  ]
}

# Azure Managed Identities 
module "managed_identites" { 
  source                            = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/azurerm_namaged_identity"

  for_each                          = { for managed_identity in local.mgd_ids : managed_identity_name => managed_identity }
  name                              = each.value.managed_identity_name
  resource_group_name               = each.value.resource_group_name

  location                          = var.region
  tags                              = local.tags
}


#ACR /AKS related settings 
module "role_assignment" {
  source                            = "git@ssh.dev.azure.com:v3/GRC-IPM/GRC-IPM/terraform-modules//Azure//RoleAssignment?ref=v1.0.91"
  for_each                          = { for role in local.role_assignments : role.role_definition_name => role }
  principal_id                      = each.value.principal_ids 
  role_definition_name              = each.value.role_definition_name 
  scope                             = each.value.scope 
  depends_on = [ 
    module.storageaccounts,
    module.managed_identites
  ]
}

data "azurerm_container_registry" "acr" {
  name                 = local.acrName 
  resource_group_name  = var.aksGroup
}
