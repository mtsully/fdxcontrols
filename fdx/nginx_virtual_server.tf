resource "kubectl_manifest" "nginx_virtual_server" {
    depends_on = [kubectl_manifest.nginx_jwt_policy, kubectl_manifest.nginx_waf_policy]
    yaml_body = <<YAML
apiVersion: k8s.nginx.org/v1
kind: VirtualServer
metadata:
  name: fdxri
spec:
  host: "fdx-ref-impl.sr.f5-cloud-demo.com"
  policies:
  - name: jwt-policy
  - name: waf-policy
  ingressClassName: nginx   
  upstreams:
  - name: fdx-gen-stub
    service: fdx-gen-stub
    port: 8080
    tls:
        enable: false
  routes:
  - path: /
    action:
      pass: fdx-gen-stub
YAML
}
