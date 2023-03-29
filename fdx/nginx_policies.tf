resource "kubectl_manifest" "nginx_jwt_policy" {
    yaml_body = <<YAML
apiVersion: k8s.nginx.org/v1
kind: Policy
metadata:
  name: jwt-policy
spec:
  jwt:
    realm: https://my.api.example.com/resource/32178
    jwksURI: https://oidc-provider.fdx.f5-cloud-demo.com/jwks
    keyCache: 1h
YAML
}

resource "kubectl_manifest" "nginx_waf_policy" {
    yaml_body = <<YAML
apiVersion: k8s.nginx.org/v1
kind: Policy
metadata:
  name: waf-policy
spec:
  waf:
    enable: true
    apPolicy: "default/dataguard-alarm"
YAML
}
