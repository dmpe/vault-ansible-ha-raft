cluster_name = "dc1"
max_lease_ttl = "768h"
default_lease_ttl = "768h"

cluster_addr = "http://testvault2.northcentralus.cloudapp.azure.com:8201"
api_addr = "http://testvault1.northcentralus.cloudapp.azure.com:8200"

plugin_directory = "/usr/local/lib/vault/plugins"

listener "tcp" {
  address = "0.0.0.0:8200"
  cluster_address = "0.0.0.0:8201"
  tls_disable = "true"
}

storage "raft" {
  path = "/var/vault"
  node_id = "testvault2"
  retry_join {
    leader_api_addr = "http://testvault1.northcentralus.cloudapp.azure.com:8200"
  }
  retry_join {
    leader_api_addr = "http://testvault2.northcentralus.cloudapp.azure.com:8200"
  }
}

// HashiCorp recommends disabling mlock when using Raft.
disable_mlock = true

ui = true
