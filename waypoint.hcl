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
        use "docker-pull" {
            image     = "nginx"
            tag        = "latest"
        }
        registry {
            use "docker" {
            }
        }
    }
    deploy {
        use "kubernetes-apply" { //possibly use kubernetes-apply here
            path        = templatedir("${path.project}/k8s")
            prune_label = "hashitalks-app"
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
