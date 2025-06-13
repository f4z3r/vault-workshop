ui            = true
cluster_addr  = "https://127.0.0.1:8201"
api_addr      = "https://127.0.0.1:8200"
disable_mlock = true

storage "raft" {
  path = "/tmp/vault/"
  node_id = "c17a8c2c-79ba-47c7-a4e7-a9f04e6add83"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = true
}
