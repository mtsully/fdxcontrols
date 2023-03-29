resource "kubectl_manifest" "nginx_virtual_server" {
    depends_on = [kubectl_manifest.nginx_policy]
    yaml_body = <<YAML
apiVersion: k8s.nginx.org/v1
kind: VirtualServer
metadata:
  name: fdxri
spec:
  host: "fdx-ref-impl.sr.f5-cloud-demo.com"
  policies:
  - name: jwt-policy    
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


#resource "kubectl_manifest" "nginx_virtual_server" {
#    depends_on = [kubectl_manifest.nginx_policy]
#    yaml_body = <<YAML
#apiVersion: k8s.nginx.org/v1
#kind: VirtualServer
#metadata:
#  name: fdxri
#spec:
#  host: "fdx-ref-impl.sr.f5-cloud-demo.com"
#  policies:
#  - name: jwt-policy
#  upstreams:
#  - name: fdxri
#    service: kubernetes_service.fdx-gen-stub.metadata.0.name
#    port: 8080
#  routes:
#  - path: /
#    action:
#      pass: fdxri
#YAML
#}
