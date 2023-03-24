resource "kubernetes_service" "fdxri_bridge_service" {
  metadata {
    name = "fdxri-bridge-service"
    namespace = "nginx-ingress"
  }
  spec {
    externalName = "fdx-gen-stub.default.svc.cluster.local"
    type = "ExternalName"
  }
}

