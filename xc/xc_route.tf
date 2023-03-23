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

    disable_custom_script = true
    disable_location_add  = true

    match {
      headers {
        invert_match = true
        name         = "Content-Type"

        // One of the arguments from this list "exact regex presence" must be set
        regex = "regex"
      }

      http_method = "http_method"

      path {
        // One of the arguments from this list "prefix path regex" must be set
        prefix = "/register/"
      }

      query_params {
        key = "assignee_username"

        // One of the arguments from this list "exact regex" must be set
        regex = "regex"
      }
    }

    request_headers_to_add {
      append = true
      name   = "value"

      // One of the arguments from this list "value secret_value" must be set
      value = "value"
    }

    request_headers_to_remove = ["host"]

    response_headers_to_add {
      append = true
      name   = "value"

      // One of the arguments from this list "value secret_value" must be set
      value = "value"
    }

    response_headers_to_remove = ["host"]

    // One of the arguments from this list "route_destination route_redirect route_direct_response" must be set

    route_destination {
      buffer_policy {
        disabled          = true
        max_request_bytes = "2048"
        max_request_time  = "30"
      }

      // One of the arguments from this list "do_not_retract_cluster retract_cluster" must be set
      retract_cluster = true

      cors_policy {
        allow_credentials = true
        allow_headers     = "value"
        allow_methods     = "GET"

        allow_origin = ["value"]

        allow_origin_regex = ["value"]
        disabled           = true
        expose_headers     = "value"
        max_age            = "value"
        maximum_age        = "-1"
      }

      destinations {
        cluster {
          name      = "test1"
          namespace = "staging"
          tenant    = "acmecorp"
        }

        endpoint_subsets = {
          "key1" = "value1"
        }

        priority = "1"
        weight   = "10"
      }

      endpoint_subsets = {
        "key1" = "value1"
      }

      hash_policy {
        // One of the arguments from this list "header_name cookie source_ip" must be set
        header_name = "host"

        terminal = true
      }

      // One of the arguments from this list "host_rewrite auto_host_rewrite" must be set
      host_rewrite = "one.volterra.com"

      mirror_policy {
        cluster {
          name      = "test1"
          namespace = "staging"
          tenant    = "acmecorp"
        }

        percent {
          denominator = "denominator"
          numerator   = "5"
        }
      }

      prefix_rewrite = "/"
      priority       = "priority"

      retry_policy {
        back_off {
          base_interval = "5"
          max_interval  = "60"
        }

        num_retries     = "3"
        per_try_timeout = "1000"

        retriable_status_codes = ["403"]

        retry_condition = ["5xx"]
        retry_on        = "5xx"
      }

      spdy_config {
        use_spdy = true
      }

      timeout = "2000"

      web_socket_config {
        idle_timeout         = "2000"
        max_connect_attempts = "5"
        use_websocket        = true
      }
    }
    service_policy {
      // One of the arguments from this list "disable context_extensions" must be set
      disable = true
    }
    skip_lb_override = true
    waf_type {
      // One of the arguments from this list "waf waf_rules app_firewall" must be set

      waf {
        waf {
          name      = "test1"
          namespace = "staging"
          tenant    = "acmecorp"
        }
      }
    }
  }
}
