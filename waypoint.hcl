project = "slsa-and-guac"

variable "hostname" {
    type = string
    default = "https://index.docker.io/v1/"
}

variable "image" {
    type = string
    default = "hanabyte/hashitalks-2022/slsa-and-guac"
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
        use "docker-pull" {
            image     = var.image
            tag       = "latest"
        }
        registry {
            use "docker" {
                serverAddress = var.serverAddress
                image    = var.image
                tag      = "latest"
                username = var.docker_username
                password = var.docker_password
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
