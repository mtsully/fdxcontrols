data "volterra_namespace" "this" {
  count = var.volterra_namespace_exists ? 1 : 0
  name  = var.volterra_namespace
}

resource "volterra_namespace" "this" {
  count = var.volterra_namespace_exists ? 0 : 1
  name  = var.volterra_namespace
}

resource "time_sleep" "wait_namespace" {
  depends_on = [volterra_namespace.this]

  create_duration = "30s"
}

resource "volterra_virtual_site" "this" {
  depends_on = [time_sleep.wait_namespace]
  name      = "fdx-security-testing-virtual-site"
  namespace = local.namespace

  site_selector {
    expressions = ["ves.io/siteName == ves-io-pa2-par"]
  }

  site_type = "REGIONAL_EDGE"
}

resource "volterra_virtual_k8s" "this" {
  depends_on = [volterra_namespace.this]
  name      = format("%s-vk8s", var.adn_name)
  namespace = local.namespace

  vsite_refs {
    name      = volterra_virtual_site.this.name
    namespace = local.namespace
  }

  provisioner "local-exec" {
    command = "sleep 100s"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "sleep 20s"
  }
}

resource "volterra_api_credential" "this" {
  name                  = substr(volterra_virtual_k8s.this.id, 1, 30)
  api_credential_type   = "KUBE_CONFIG"
  expiry_days           = 20
  virtual_k8s_namespace = local.namespace
  virtual_k8s_name      = format("%s-vk8s", var.adn_name)
  lifecycle {
    ignore_changes = [
      name
    ]
  }
}

resource "local_file" "this_kubeconfig" {
  content  = base64decode(volterra_api_credential.this.data)
  filename = format("%s/_output/xc_vk8s_kubeconfig", path.root)
}

resource "time_sleep" "wait_k8s_server" {
  depends_on = [local_file.this_kubeconfig]

  create_duration = "120s"
}

