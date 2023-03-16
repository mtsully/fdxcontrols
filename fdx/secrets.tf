resource "kubernetes_secret" "fdx-docker-registry" {
    metadata {
        name = "fdx-docker-registry"
    }
    
    type = "kubernetes.io/dockerconfigjson"

    data = {
        ".dockerconfigjson" = jsonencode({
            auths = {
                "docker-registry.financialdataexchange.org" = {
                    "username" = var.fdx_dockerhub_username
                    "password" = var.fdx_dockerhub_password
                    "auth"     = base64encode("${var.fdx_dockerhub_username}:${var.fdx_dockerhub_password}"
                }
            }
        })
    }
}
