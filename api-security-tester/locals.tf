locals {
  namespace = var.volterra_namespace_exists ? join("", data.volterra_namespace.this.*.name) : join("", volterra_namespace.this.*.name)
  fdx_security_tester_manifest_content = templatefile(format("%s/manifest/api_security_tester.tpl", path.module), {
    robot_tests_url           = indent(4, var.robot_tests_url)
    nuclei_templates_url       = indent(4, var.nuclei_templates_url)
  })
  js_delay_list = var.disable_js_challenge ? [] : [
    {
      js_script_delay = var.js_script_delay
      cookie_expiry   = var.js_cookie_expiry
    }
  ]
}
