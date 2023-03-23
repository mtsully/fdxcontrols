resource "volterra_route" "default" {
  name                   = format("%s-xcop-%s", local.deployment_name, local.region)
  namespace              = var.xc_namespace
  description            = format("Route pointing to origin server %s", local.origin_server)

  routes {
    // One of the arguments from this list "inherited_bot_defense_javascript_injection bot_defense_javascript_injection" must be set
    inherited_bot_defense_javascript_injection = true

    bot_defense_javascript_injection_inline_mode {
      element_selector = "value"
      insert_content   = "value"
      position         = "position"
    }
    
    match {
      path {
        // One of the arguments from this list "prefix path regex" must be set
        prefix = "/"
      }
    }

    // One of the arguments from this list "route_destination route_redirect route_direct_response" must be set

    route_destination {
      destinations {
        cluster {
          name      = volterra_origin_pool.op.name
          namespace = var.xc_namespace          
        }
      }

      // One of the arguments from this list "host_rewrite auto_host_rewrite" must be set
      auto_host_rewrite = false
    }
    service_policy {
      // One of the arguments from this list "disable context_extensions" must be set
      disable = true
    }
    waf_type {
      // One of the arguments from this list "waf waf_rules app_firewall" must be set
      waf {
        waf {
          name      = volterra_app_firewall.waap-tf.name
          namespace = var.xc_namespace
        }
      }
    }
  }
}
