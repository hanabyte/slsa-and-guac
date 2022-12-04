project = "slsa-and-guac"

variable "registry" {
    type = string
    default = "gcr.io/hashitalks-2022"
}

runner {
    enabled = true

    data_source "git" {
        url  = "https://github.com/hashicorp/waypoint-examples.git"
        path = "/"
    }
}

app "slsa-and-guac-app" {
    build {
        use "docker" {
            disable_entrypoint = true
        }
        registry {
            use "docker" {
                image     = "${var.registry}/slsa-and-guac"
                tag        = "latest"
            }
        }
    }
    deploy {
        use "kubernetes-apply" { //possibly use kubernetes-apply here
            path        = templatedir("${path.pwd}/k8s")
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