resource "kubectl_manifest" "nginx_policy" {
    yaml_body = <<YAML
apiVersion: k8s.nginx.org/v1
kind: Policy
metadata:
  name: jwt-policy
spec:
  jwt:
    realm: "https://my.api.example.com/resource/32178"
    token: $http_token
    jwksURI: https://oidc-provider.fdx.f5-cloud-demo.com/jwks
    keyCache: 1h
YAML
}
