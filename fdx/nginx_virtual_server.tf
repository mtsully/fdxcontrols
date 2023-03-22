resource "kubectl_manifest" "virtual_server" {
    yaml_body = <<YAML
apiVersion: k8s.nginx.org/v1
kind: VirtualServer
metadata:
  name: fdxri
spec:
  host: webapp.example.com
  policies:
  - name: jwt-policy
  upstreams:
  - name: fdxri
    service: kubernetes_service.fdxri.metadata.0.name
    port: 8080
  routes:
  - path: /
    action:
      pass: fdxri
YAML
}
