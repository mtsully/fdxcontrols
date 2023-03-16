resource "kubernetes_secret" "fdx-docker-registry" {
    metadata {
        name = "fdx-docker-registry"
    }
    
    type = "kubernetes.io/dockerconfigjson"

    data = {
        ".dockerconfigjson" = jsonencode({
            auths = {
                "${var.nginx_registry}" = {
                    "username" = var.nginx_jwt
                }
            }
        })
    }
}
