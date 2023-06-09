resource "kubernetes_secret" "docker-registry" {
    metadata {
        name = "regcred"
        namespace = kubernetes_namespace.nginx-ingress.metadata[0].name
    }
    
    type = "kubernetes.io/dockerconfigjson"

    data = {
        ".dockerconfigjson" = jsonencode({
            auths = {
                "${var.nginx_registry}" = {
                    "username" = "${file("${var.nginx_jwt}")}"
                    "password" = "none"
                    "auth"     = base64encode("${file("${var.nginx_jwt}")}:none")
                }
            }
        })
    }
}
