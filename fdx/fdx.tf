resource "kubernetes_deployment" "fdxri" {
  metadata {
    name = "fdxri"
    labels = {
      app = "fdxri"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "fdxri"
      }
    }
    template {
      metadata {
        labels = {
          app = "fdxri"
        }
      }
      spec {
        container {
          name  = "fdxri"
          image = "docker-registry.financialdataexchange.org/fdxri_dc_tomcat:latest"

          port {
            container_port = 8080
          }
          image_pull_policy = "IfNotPresent"
        }
        image_pull_secrets {
          name = "fdx-docker-registry"
        }
      }
    }
  }
}

resource "kubernetes_service" "fdxri" {
  metadata {
    name = "fdxri"
    labels = {
      app = "fdxri"
      service = "fdxri"
    }
  }
  spec {
    port {
      protocol    = "TCP"
      port        = 8080
      target_port = "8080"
    }
    selector = {
      app = "fdxri"
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_deployment" "postgres-container" {
  metadata {
    name = "postgres-container"
    labels = {
      app = "postgres_container"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "postgres_container"
      }
    }
    template {
      metadata {
        labels = {
          app = "postgres_container"
        }
      }
      spec {
        container {
          name  = "postgres_container"
          image = "docker-registry.financialdataexchange.org/fdxri_pgdb:latest"
          port {
            container_port = 5432
          }
          image_pull_policy = "IfNotPresent"
        }
        image_pull_secrets {
          name = "fdx-docker-registry"
        }
      }
    }
  }
}

resource "kubernetes_service" "postgres" {
  metadata {
    name = "postgres"
    labels = {
      app = "postgres_container"
      service = "postgres"
    }
  }
  spec {
    port {
      protocol    = "TCP"
      port        = 5432
      target_port = "5432"
    }
    selector = {
      app = "postgres_container"
    }
    type = "ClusterIP"
  }
}
