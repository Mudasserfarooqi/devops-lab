terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "html_app_image" {
  name = "devops-html-app"
  build {
    path = "."  # This points to the current directory (terraform)
    dockerfile = "Dockerfile"  # This is relative to the terraform directory
  }
}


resource "docker_container" "html_app" {
  name  = "html-app-container"
  image = docker_image.html_app_image.latest
  ports {
    internal = 80
    external = 8086
  }
}

