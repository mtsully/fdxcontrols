#AWS: name = format("%s-nap-%s", local.project_prefix, local.build_suffix)
resource "helm_release" "nginx-plus-ingress" {
    name = format("%s-nap-%s", local.deployment_name, local.region)
    repository = "https://helm.nginx.com/stable"
    chart = "nginx-ingress"
    namespace = kubernetes_namespace.nginx-ingress.metadata[0].name
    values = [file("./charts/nginx-app-protect/new_values.yaml")]

    depends_on = [
      kubernetes_secret.docker-registry
    ]
}
