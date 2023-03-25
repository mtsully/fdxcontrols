resource "kubernetes_deployment" "fdx-gen-stub" {
  metadata {
    name = "fdx-gen-stub"
    labels = {
      app = "fdx-gen-stub"
      dummy = "tmp1"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "fdx-gen-stub"
      }
    }
    template {
      metadata {
        labels = {
          app = "fdx-gen-stub"
        }
      }
      spec {
        container {
          name  = "fdx-openapi-mock" 
          image = "muonsoft/openapi-mock"
          env {
              name = "OPENAPI_MOCK_SPECIFICATION_URL"
              value = "https://raw.githubusercontent.com/vtobi/fdx-controls-reference-implementation/main/fdx/fdxapi.yaml"
          }
          
#          name  = "fdx-gen-stub"
#          image = "registry.gitlab.com/f5-security-test/fdx-generated-stub-server"
          

          port {
            container_port = 8080
          }
          image_pull_policy = "Always"
        }
      }
    }
  }
  
}

resource "kubernetes_service" "fdx-gen-stub" {
  metadata {
    name = "fdx-gen-stub"
    labels = {
      app = "fdx-gen-stub"
      service = "fdx-gen-stub"
    }
  }
  spec {
    port {
      protocol    = "TCP"
      port        = 8080
      target_port = "8080"
    }
    selector = {
      app = "fdx-gen-stub"
    }
    type = "ClusterIP"
  }
}



#resource "kubernetes_deployment" "fdxri" {
#  metadata {
#    name = "fdxri"
#    labels = {
#      app = "fdxri"
#    }
#  }
#  spec {
#    replicas = 1
#    selector {
#      match_labels = {
#        app = "fdxri"
#      }
#    }
#    template {
#      metadata {
#        labels = {
#          app = "fdxri"
#        }
#      }
#      spec {
#        host_aliases {
#          ip = "127.0.0.1"
#          hostnames = ["postgres_container"]
#        }
#        container {
#          name  = "fdxri"
#          image = "docker-registry.financialdataexchange.org/fdxri_dc_tomcat:latest"
#
#          port {
#            container_port = 8080
#          }
#          image_pull_policy = "IfNotPresent"
#        }
#        container {
#          name  = "postgres-container"
#          image = "docker-registry.financialdataexchange.org/fdxri_pgdb:latest"
#          port {
#            container_port = 5432
#          }
#          image_pull_policy = "IfNotPresent"
#        }
#        image_pull_secrets {
#          name = "fdx-docker-registry"
#        }
#      }
#    }
#  }
#}

#resource "kubernetes_service" "fdxri" {
#  metadata {
#    name = "fdxri"
#    labels = {
#      app = "fdxri"
#      service = "fdxri"
#    }
#  }
#  spec {
#    port {
#      protocol    = "TCP"
#      port        = 8080
#      target_port = "8080"
#    }
#    selector = {
#      app = "fdxri"
#    }
#    type = "ClusterIP"
#  }
#}

#resource "kubernetes_deployment" "postgres-container" {
#  metadata {
#    name = "postgres-container"
#    labels = {
#      app = "postgres-container"
#    }
#  }
#  spec {
#    replicas = 1
#
#    selector {
#      match_labels = {
#        app = "postgres-container"
#      }
#    }
#    template {
#      metadata {
#        labels = {
#          app = "postgres-container"
#        }
#      }
#      spec {
#        container {
#          name  = "postgres-container"
#          image = "docker-registry.financialdataexchange.org/fdxri_pgdb:latest"
#          port {
#            container_port = 5432
#          }
#          image_pull_policy = "IfNotPresent"
#        }
#        image_pull_secrets {
#          name = "fdx-docker-registry"
#        }
#      }
#    }
#  }
#}

#resource "kubernetes_service" "postgres" {
#  metadata {
#    name = "postgres"
#    labels = {
#      app = "postgres-container"
#      service = "postgres"
#    }
#  }
#  spec {
#    port {
#      protocol    = "TCP"
#      port        = 5432
#      target_port = "5432"
#    }
#    selector = {
#      app = "postgres-container"
#    }
#    type = "ClusterIP"
#  }
#}
