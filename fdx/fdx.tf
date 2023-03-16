resource "kubernetes_deployment" "fdxri_tomcat" {
  metadata {
    name = "fdxri-tomcat"
    labels = {
      app = "fdxri-tomcat"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "fdxri-tomcat"
      }
    }
    template {
      metadata {
        labels = {
          app = "fdxri-tomcat"
        }
      }
      spec {
        container {
          name  = "fdxri-tomcat"
          image = "docker-registry.financialdataexchange.org/fdxri_dc_tomcat:latest"

          port {
            container_port = 8080
          }
          image_pull_policy = "IfNotPresent"
        }
      }
    }
  }
}

resource "kubernetes_service" "fdxri-tomcat" {
  metadata {
    name = "fdxri-tomcat"
    labels = {
      app = "fdxri-tomcat"
      service = "fdxri-tomcat"
    }
  }
  spec {
    port {
      protocol    = "TCP"
      port        = 8080
      target_port = "8080"
    }
    selector = {
      app = "fdxri-tomcat"
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_deployment" "postgres-container" {
  metadata {
    name = "postgres-container"
    labels = {
      app = "postgres-container"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "postgres-container"
      }
    }
    template {
      metadata {
        labels = {
          app = "postgres-container"
        }
      }
      spec {
        container {
          name  = "postgres-container"
          image = "docker-registry.financialdataexchange.org/fdxri_pgdb:latest"
          port {
            container_port = 5432
          }
          image_pull_policy = "IfNotPresent"
        }
      }
    }
  }
}

resource "kubernetes_service" "postgres" {
  metadata {
    name = "postgres"
    labels = {
      app = "postgres-container"
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
      app = "postgres-container"
    }
    type = "ClusterIP"
  }
}
