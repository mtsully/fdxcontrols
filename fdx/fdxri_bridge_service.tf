resource "kubectl_manifest" "fdxri_bridge_service" {
    depends_on = [kubectl_manifest.nginx_policy]
    yaml_body = <<YAML
kind: Service
metadata:
  name: fdxri-bridge-service
  namespace: nginx-ingress
spec:
  type: ExternalName
  externalName: fdx-gen-stub.default.svc.cluster.local
  ports:
  - port: 8080
YAML
}
