resource "volterra_origin_pool" "oidc-provider-pool" {
  depends_on = [time_sleep.wait_namespace]
  name                   = format("%s-oidc-provider-pool", var.adn_name)
  namespace              = local.namespace
  description            = format("Origin pool pointing to OIDC Provider k8s service running on RE's")
  loadbalancer_algorithm = "ROUND ROBIN"
  origin_servers {
    k8s_service {
      inside_network  = false
      outside_network = false
      vk8s_networks   = true
      service_name    = format("nodeoidcprovider.%s", local.namespace)
      site_locator {
        virtual_site {
          name      = "fdx-security-testing-virtual-site"
          namespace = local.namespace
        }
      }
    }
  }
  port               = 3000
  no_tls             = false
  endpoint_selection = "LOCAL_PREFERRED"
}

resource "volterra_app_firewall" "oidc-firewall" {
  depends_on = [time_sleep.wait_namespace]
  name                     = format("%s-waf", var.adn_name)
  description              = format("WAF in block mode for %s", var.adn_name)
  namespace                = local.namespace
  allow_all_response_codes = true
  blocking                 = var.blocking
}

#resource "volterra_http_loadbalancer" "oidc-provider-lb" {
#  depends_on = [time_sleep.wait_namespace]
#  name                            = format("%s-oidc-provider-lb", var.adn_name)
#  namespace                       = local.namespace
#  description                     = format("HTTPS loadbalancer object for %s-oidc-provider origin server", var.adn_name)
#  domains                         = [format("oidc-provider.%s", var.app_domain)]
#  advertise_on_public_default_vip = true
#  default_route_pools {
#    pool {
#      name      = volterra_origin_pool.oidc-provider-pool.name
#      namespace = local.namespace
#    }
#  }
#
#  http {
#    dns_volterra_managed = true
#    port                 = "80"
#  }
#
#  https_auto_cert {
#    add_hsts      = var.enable_hsts
#    http_redirect = var.enable_redirect
#    no_mtls       = true
#  }
#
#  https {
#    http_redirect = false
#    add_hsts = false
#    port = 443
#    tls_parameters {
#      tls_certificates {
#          certificate_url = var.oidc_provider_ssl_cert
#          private_key {
#            clear_secret_info {
#              url = var.oidc_provider_ssl_key
#            }
#          }
#        }
#    }
#  }
#
#  app_firewall {
#    name      = volterra_app_firewall.oidc-firewall.name
#    namespace = local.namespace
#  }
#  disable_waf                     = false
#  disable_rate_limit              = true
#  round_robin                     = true
#  service_policies_from_namespace = true
#  no_challenge                    = var.disable_js_challenge
#  dynamic "js_challenge" {
#    for_each = local.js_delay_list
#    content {
#      js_script_delay = js_challenge.value["js_script_delay"]
#      cookie_expiry   = js_challenge.value["cookie_expiry"]
#    }
#  }
#}

resource "volterra_origin_pool" "oidc-proxy-pool" {
  depends_on = [time_sleep.wait_namespace]
  name                   = format("%s-oidc-proxy-pool", var.adn_name)
  namespace              = local.namespace
  description            = format("Origin pool pointing to OIDC Proxy k8s service running on RE's")
  loadbalancer_algorithm = "ROUND ROBIN"
  origin_servers {
    k8s_service {
      inside_network  = false
      outside_network = false
      vk8s_networks   = true
      service_name    = format("nodeoidcproxy.%s", local.namespace)
      site_locator {
        virtual_site {
          name      = "fdx-security-testing-virtual-site"
          namespace = local.namespace
        }
      }
    }
  }
  port               = 8080
  no_tls             = false
  endpoint_selection = "LOCAL_PREFERRED"
}


#resource "volterra_http_loadbalancer" "oidc-proxy-lb" {
#  depends_on = [time_sleep.wait_namespace]
#  name                            = format("%s-oidc-proxy-lb", var.adn_name)
#  namespace                       = local.namespace
#  description                     = format("HTTPS loadbalancer object for %s-oidc-proxy origin server", var.adn_name)
#  domains                         = [format("oidc-proxy.%s", var.app_domain)]
#  advertise_on_public_default_vip = true
#  default_route_pools {
#    pool {
#      name      = volterra_origin_pool.oidc-proxy-pool.name
#      namespace = local.namespace
#    }
#  }
#
#  http {
#    dns_volterra_managed = true
#    port                 = "80"
#  }
#
#  https_auto_cert {
#    add_hsts      = var.enable_hsts
#    http_redirect = var.enable_redirect
#    no_mtls       = true
#  }
#
#  https {
#    http_redirect = false
#    add_hsts = false
#    port = 443
#    tls_parameters {
#      tls_certificates {
#          certificate_url = var.oidc_proxy_ssl_cert
#          private_key  {
#            clear_secret_info  {
#              url = var.oidc_proxy_ssl_key
#            }
#          }
#        }
#    }
#  }
#
#  app_firewall {
#    name      = volterra_app_firewall.oidc-firewall.name
#    namespace = local.namespace
#  }
#  disable_waf                     = false
#  disable_rate_limit              = true
#  round_robin                     = true
#  service_policies_from_namespace = true
#  no_challenge                    = var.disable_js_challenge
#  dynamic "js_challenge" {
#    for_each = local.js_delay_list
#    content {
#      js_script_delay = js_challenge.value["js_script_delay"]
#      cookie_expiry   = js_challenge.value["cookie_expiry"]
#    }
#  }
#}
