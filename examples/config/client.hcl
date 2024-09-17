bind_addr      = "0.0.0.0"

data_dir       = "/home/nomad"

log_level      = "DEBUG"

server {
    enabled   = false
}

advertise {
  http = "0.0.0.0"
}

client {
    enabled   = true
    node_pool = "linux"

    host_volume "docker-volumes" {
        path      = "/home/data/volumes/"
        read_only = false
    }
}

ports {
    http   = 4646
    rpc    = 4647
    serf   = 4648
}

acl {
    enabled = true
}


plugin "raw_exec" {
    config {
        enabled = true
    }
}

plugin "nomad-driver-podman" {
    config {
        socket_path            = "unix:///run/user/1000/podman/podman.sock"
        disable_log_collection = true

    }
}

consul {
    address             = "127.0.0.1:8500"
    grpc_address        = "127.0.0.1:8502"

    token               = "token"

    ssl                 = false

    auto_advertise      = true
    check_use_advertise = true

    server_auto_join    = true
    client_auto_join    = true
}
