locals {
  namespace = data.tfe_outputs.xc-vk8s.values.xc_namespace
  adn_name = data.tfe_outputs.xc-vk8s.values.adn_name
  fdx_security_tester_manifest_content = templatefile(format("%s/manifest/api_security_tester.tpl", path.module), {
    aws_s3_bucket_name    = indent(4, "")
    gcp_storage_bucket_name    = indent(4, "")
    mail_host   = indent(4, var.mail_host)
    mail_port    = indent(4, var.mail_port)
    mail_api_key    = indent(4, var.mail_api_key)
    mail_api_secret    = indent(4, var.mail_api_secret)
    mail_from_addr    = indent(4, var.mail_from_addr)
    mail_to_addr    = indent(4, var.mail_to_addr)   
  })
  js_delay_list = var.disable_js_challenge ? [] : [
    {
      js_script_delay = var.js_script_delay
      cookie_expiry   = var.js_cookie_expiry
    }
  ]
}
