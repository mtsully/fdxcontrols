

resource "local_file" "this_kubeconfig" {
  content  = base64decode(data.tfe_outputs.xc-vk8s.values.xc_vk8s_kubeconfig)
  filename = format("%s/_output/fdx_security_tester_adn_vk8s_kubeconfig", path.root)
}

resource "local_file" "fdx_security_tester_manifest" {
  content  = local.fdx_security_tester_manifest_content
  filename = format("%s/_output/fdx-security-tester.yaml", path.root)
}

resource "null_resource" "apply_manifest" {
  depends_on = [local_file.fdx_security_tester_manifest, local_file.this_kubeconfig]
  triggers = {
    manifest_sha1 = sha1(local.fdx_security_tester_manifest_content)
  }
  
  # download kubectl
  provisioner "local-exec" {
    command = "curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl"
  }
  
  provisioner "local-exec" {
    command = "./kubectl apply -f _output/fdx-security-tester.yaml"
    environment = {
      KUBECONFIG = format("%s/_output/fdx_security_tester_adn_vk8s_kubeconfig", path.root)
    }
  }
  provisioner "local-exec" {
    when    = destroy
    command = "./kubectl delete -f _output/fdx-security-tester.yaml --ignore-not-found=true"
    environment = {
      KUBECONFIG = format("%s/_output/fdx_security_tester_adn_vk8s_kubeconfig", path.root)
    }
    on_failure = continue
  }
}


#resource "kubectl_manifest" "apply_manifest" {
#    depends_on = [time_sleep.wait_k8s_server]
#    yaml_body = local.fdx_security_tester_manifest_content
#}

#resource "null_resource" "apply_manifest" {
#  depends_on = [time_sleep.wait_k8s_server]
#  triggers = {
#    manifest_sha1 = sha1(local.fdx_security_tester_manifest_content)
#  }
#  provisioner "local-exec" {
#    command = "kubectl apply -f _output/fdx-security-tester.yaml"
#    environment = {
#      KUBECONFIG = format("%s/_output/fdx_security_tester_adn_vk8s_kubeconfig", path.root)
#    }
#  }
#  provisioner "local-exec" {
#    when    = destroy
#    command = "kubectl delete -f _output/fdx-security-tester.yaml --ignore-not-found=true"
#    environment = {
#      KUBECONFIG = format("%s/_output/fdx_security_tester_adn_vk8s_kubeconfig", path.root)
#    }
#    on_failure = continue
#  }
#}
