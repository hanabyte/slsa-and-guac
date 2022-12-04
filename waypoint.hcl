project = "slsa-and-guac"

variable "registry" {
    type = string
    default = "gcr.io/hashitalks-2022"
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
        use "docker" {
            buildkit           = false
            disable_entrypoint = true
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
