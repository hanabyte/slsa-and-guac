project = "slsa-and-guac"

variable "image" {
  type    = string
  default = "ghcr.io/hanabyte/slsa-and-guac"
}

variable "tag" {
  type    = string
  default = "main"
}

variable "docker_username" {
  type = string
}

variable "docker_password" {
  type = string
}

app "slsa-and-guac-app" {
  build {
    use "docker-pull" {
      image = var.image
      tag   = var.tag
    }
    registry {
      use "docker" {
        image    = var.image
        tag      = var.tag
        username = var.docker_username
        password = var.docker_password
      }
    }
  }
  deploy {
    use "kubernetes" {}
  }
}
