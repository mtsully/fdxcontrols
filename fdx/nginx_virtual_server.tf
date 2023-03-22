resource "kubectl_manifest" "nginx_virtual_server" {
    depends_on = [kubectl_manifest.nginx_policy]
    yaml_body = <<YAML
apiVersion: k8s.nginx.org/v1
kind: VirtualServer
metadata:
  name: fdxri
spec:
  host: "*"
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
