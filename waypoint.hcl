project = "slsa-and-guac"

variable "registry" {
    type = string
    default = "gcr.io/hashitalks-2022"
}

variable "docker_username" {
    type = string
}

variable docker_password {
    type = string
}

#runner {
#    enabled = true

#    data_source "git" {
#        url  = "https://github.com/hanabyte/slsa-and-guac.git"
#        path = "/"
#    }
#}

app "slsa-and-guac-app" {
    build {
        use "docker" {}
        registry {
            use "docker" {
                image     = "hanabyte/hashitalks-2022/slsa-and-guac"
                tag       = "latest"
                auth {
                    username = var.docker_username
                    password = var.docker_password
                }
            }
        }
    }
    deploy {
        use "kubernetes" {
        }
    }
    #release {
    #use "kubernetes" {
    #  ingress {
    #    //The following field was skipped during file generation
    #    tls = ""
    #  }
    #}
    #}
}
