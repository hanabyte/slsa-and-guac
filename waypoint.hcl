project = "slsa-and-guac"

variable "hostname" {
    type = string
    default = "https://index.docker.io/v1/"
}

variable "image" {
    type = string
    default = "hanabyte/hashitalks-2022/slsa-and-guac"
}

variable "registry_username" {
    type = string
}

variable registry_password {
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
            disable_entrypoint = true
            image              = var.image
            tag                = "latest"
        }
        registry {
            use "docker" {
                image    = var.image
                tag      = "latest"
                username = var.registry_username
                password = var.registry_password
                local    = false
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
