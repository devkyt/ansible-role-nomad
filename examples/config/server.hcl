bind_addr      = "0.0.0.0"

data_dir       = "/home/nomad"

log_level      = "DEBUG"

server {
    enabled          = true
    bootstrap_expect = 1
}

advertise {
    http = "0.0.0.0"
}

client {
    enabled   = true
    node_pool = "linux"
}

ports {
    http   = 4646
    rpc    = 4647
    serf   = 4648
}

acl {
    enabled = true
}


ui {
    enabled = true
}

plugin "raw_exec" {
    config {
        enabled = true
    }
}

consul {
    address             = "127.0.0.1:8500"
    grpc_address        = "127.0.0.1:8502"

    token               = "token"

    server_service_name = "nomad"
    client_service_name = "jupyter"

    ssl                 = false

    auto_advertise      = true
    check_use_advertise = true

    server_auto_join    = true
    client_auto_join    = true

}
