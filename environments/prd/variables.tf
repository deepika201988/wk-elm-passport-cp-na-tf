variable "tenantId" {
    description  = " The id of the Azure tenant we 'll be working in"
}
variable "region" {
    description  = " the region where our resources will be provided "
    type         = string 
}
variable "vnetGroup" {
    description  = "virtual network resource group Name"
    type         = string 
}
variable "vnetName" {
    description   = "virtual network name " 
}
variable "subscriptionId" { 
    description  = "Id of the Azure subscription we 'll be working in" 
}
variable "clientId" { 
    description = "The client id of the SPN we 'll be using to authenticate with" 
}
variable "clientSecret" {
     description ="The client secret of the SPN we 'll be using the authenticate with true"
     sensitive  = true
}
variable "regionCode" {
    description = " Region code for the resources to be deployed " 
    type         = string 
}
variable "businessUnit" { 
    description   = "Business unit for the application" 
    type         = string 
}
variable "divisionCode" {
    description = "Division Code for the resources to be deployed " 
}
variable "buCode" { 
    description  = ""Bucode  for the resources to be deployed "
    type         = string 
}
variable "division" { 
    description = " division for the application"
    type         = string 
}
variable "envCode" { 
    description = "envCode  for the application"
    type         = string 
}
variable "envType" {
    description = "envType  for the application "
    type         = string 
}
variable "appCodepp" {
    description ="Application code as per GBS" 
    type         = string  
}
variable "appCodecp" {
    description = "Application code as per GBS"
    type         = string 
}
variable "appNamepp " {
    description = "Application code as per GBS"
    type         = string 
}
variable "appNamecp " {
    description = "Application code as per GBS"
    type         = string 
}
variable "CostCenter" {
    description = "CostCenter  for the application "
    type         = string 
}
variable "envString" {
    description = "Short hand name for the environment"
}
variable "applicationId" { 
    description = "The application Id "
    type         = string 
}
variable "applicationBITId" { 
    description = "The application Barometer IT Id "
    type         = string 
}
variable "infraSupportGroup" {
    description = "Name of the infrastructure support group" 
    type         = string 
}
variable "appSupportGroup" {
    description = "Name of the application  support group" 
    type         = string 
}
variable "continent" {
    description = "Continent where the application is hosted" 
    type         = string 
}
variable "keyvaults" { 
    description = "Map of KeyVaults and Access Policies
    type = list(object({
      keyvaultName = string,
      accesspolicies = list(object({
         object_id         = list(sting),
         key_permissions   = list(sting),
         secret_permissions = list(sting),
         storage_permissions = list(sting)
      }))
    }))
    default = []
}
variable "kvtgroupname" { 
    type   = string 
    description = " Resource Group Name Keyvaults would be deployed"
}
variable "keyvaultSkuName" { 
    description = "Name of the SKU used for this key vault" 
    type        = string 
}
variable "purgeprotectionenabled" {
    description  = " Purge Protection enabled for this keyvault"
    type         = bool 
}
variable "private_endpoint" { 
    description = " Private endpoints need to be enabled for keyvault"
    type        = bool 
    default     = true 
}
variable "webappCertUrl" {
    description = " Define the webappCertUrl"
}
variable "containerName" { 
    description = "The blob container where our state file is stored" 
}
variable "containerKey" { 
    description = "The blob container where our state file is stored" 
}

# Storage account Variable
variable "storageGroup" {
    description = "Resource Group Storage Accounts will be deployed" 
    type        = string
}
variable "storageReplicationType" { 
    description  = "Storage account ReplicationType, one of LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
    type        = string 
}
variable "storageAccountTier" {
    description = "Storage account Tier: Standard or Premium"
    type        = string 
}

#sql Elastic pool 
variable "sqlGroup" {
    type        = string
    description  = "The name of the resource group in which to create th MS SQL Server"
}
variable "mssql_dbname" {
    type        = set(string) 
    description = "SQL Database name" 
}
variable "pool_min_capacity" {
    type       = number 
    description = "The minimum capacity all databases are guaranteed
}
variable "pool_max_capacity" {
      type       = number 
    description = "The maximum capacity all databases are guaranteed
}
variable "pool_max_size_gb" {
     type       = number 
    description  = "The max data size of the elastic pool in gigabyte. Conflicts with pool_max_size_bytes"
}
variable "pool_sku" { 
    description = " Map of sku" 
    type = object({
      name   = string # the name of the SKU , will be either vCore based tier +family pattern(e.g. GP_Gen4, BC_Gen5) or the DTU based BasicPool, StandardPool, pr PremiumPool pattern
      capacity = number # Server's compute units. For more information see the documentationn for your elastic pool configuration : vCore- based or DTU based 
      tier     = string # possible values are General Purpose , Business critical, Basic, Standard, or Premium 
      family   = string # The family of hardware Gen4, Gen5,Fsv2 or DC 
    })
}

#CosmosDB(Mongodb) 
variable "cosmosdbResourceGroupName" {
    type  = string
    description = " Resource group cosmos db will be deployed"
}
variable "mongodbAccountName" {
    type  = string 
    description = " Resource group mongodb will be deployed"
}
variable "mongodbVersion" {
    type  = string
    description - "Mongodb Version" 
}
variable "mongoAccountCapabilities" {
    type        = set(string)
    description = " Configures the capabilities to enable for this Cosmos DB account " 
}
variable "cosmosdbFailoverLocations" {
    type       = map(map(string))
    description = " Configures the capbilities to enable for this CosmosDb account"
}
variable "cosmosdbFailoverLocations_mongo" {
    type       = map(map(string))
    description = " Cosmos DB failover locations " 
}
#VM Group 
variable "vmGroup" {
    description  = " Virtual machine resource group Name" 
    type = string
}
variable "atmGroup" {
    description  = " Virtual machine resource Group name "
    type  = string 
}
# SQL MI Variables
variable "sqlmiGroup" {
    description = "sql Mi resource group Name 
    type  = string
}
variable "pairedregion" {
    description = "The paired region where our resurces will be provisioned/Replicated"
    type = string 
}
variable "subnetiprange_01 { 
    description = "SQL MI Subnet IP range 
    type = string  
}
variable "subnetiprange_02 { 
    description = "SQL MI Subnet IP range 
    type = string  
}
variable "subnetiprange_03 { 
    description = "SQL MI Subnet IP range 
    type = string  
}
variable "subnetiprange_04 { 
    description = "SQL MI Subnet IP range 
    type = string  
}
variable "license_type" {
    description  = " SQL MI License Type Hybrid or Azure 
    type  = string 
}
variable "adminLogin" {
    description = " SQL MI Admin user login Name to be stored in KV"
    type  = string
}

#elb 
variable "elbGroup" {
    type  = string
    description "Specifies the name of the Virtual Machine Resource Group 
} 
variable "elb_type" {
    description = "Defined if the load balance is private or public"
    type = string
    default = ""
}
variable "elb_allocation_method" {
    type = string 
    description = "The allocation method for the Public Ip Address for this load balancer. Possible values as Dynamic or static 
}
variable "zones" {
    type = list(string)
    description = " Specifies a list of availability zones in which the IP address or this load balancer should be located. Chnaging this forces a new load balancer to be created
}
variable "elb_public_ip_address_id" { 
    type = string 
    description = " The ID of a public IP address which is associated with this load balancer" .
    default = ""
}
variable "lbGroup" {
    type = string 
    description = "specifies the name of the virtual Machine resource group "
}

# Public ip 
variable "pipGroup" { 
    description = "The name of the resoirce group in which to create the public ip"
    type = string 
}
variable "pip_allocation_method" {
    description = " Define the allocation method for this IP address. Possible values are Static or Dynamic . Dynamic Public Ip Addresses arent allowed until they re assigned to a resource (such as Virtual machine or a load balancer) by design within the Azure"
    type = string 
}
variable "pip_sku" { 
    description = " The SKU of the public IP. Accepted values are Basic and Standard" 
    type = string 
}
variable "pip_sku_tier" {
    description = " The SKU Tier that should be used for the Public IP. Possible values are regional and global"
    type  = string
}

# Atm variables 
variable "atm_protocol" {
    type = string
    description = " protocol used by the monitoring checks , supported values are HTTP, HTTPS and TCP"
}
variable "atm_port" {
    type  = number 
    description = "port number used by the monitoring checks"
}
variable "atm_traffic_routing_method" {
    description = " Specifies the algorithm used to route traffic"
    type = string 
}

# Redis Cache Variables 
variable "redisGroup" {
    type = string
    description = " Resource Group redis cache will be deployed "
}
variable "redis_zones" {
    description = " A list of one or more availability Zones, where the Redis cache should br allocated"
    type = list(number)
    default = [1,2]
}
varible "rchsubnetiprange" {
    description = "subnet ip range for redis cahce 
    type = string 
}
variable "clientsubnetiprange" {
    type = set(string)
    description = "bke and ui subnet ip range"
}
variable "redis_skuName" {
    description = "The SKU family/pricing group to use . Valid values are C (for Basic/ Standard SKU family) and P (for Premium)"
    type = string 
}
variable "redis_capacity" { 
    description = " The size of the redis cache to deploy. Valid values for SKU family of C (for Basic/ Standard) are 0,1,2,3,4,5,6, and for P (premium) family are 1,2,3,4 "
    type = number 
}
variable "enable_pvt_endpoint" {
    type = bool 
    description = "Enable private Endpoint for Redis Cache"
}

#Managed Identities
variable "ppcpSpn" {
    type = string
    description = "SPN used by PPCP CI pipelines 
}
variable "aksGroup" {
    description = " ResourceGroup where AKS and ACR have been provisioned"
    type = string 
}

# Cosmos DB (Cassandradb)
variable "cosmosdbGroup" {
    type = string
    description = " ResourceGroup Cosmos will be deployed 
}
variable "CassandraAccountCapabilities" {
    type = set(string)
    description = " Configures the capabilities to enable for this Cosmos DB account"
}
variable "cassandra_sub_type" {
    description = " The Azure region in which to create resource"
    type = string 
}
variable "cassandra_subresources_names" {
    description = " subresurce names for private service connection for private Endpoint
    type = list(string)
}
variable "cassandra_kind" {
    description = " Kind of Cosmos DB"
    type = string 
}