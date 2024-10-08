terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
}
# This forwards HTTP -> HTTPS on a frontend LB
resource "kubectl_manifest" "app_frontend_config" {
  wait_for_rollout = true
  yaml_body = yamlencode({
    apiVersion = "networking.gke.io/v1beta1"
    kind       = "FrontendConfig"
    metadata = {
      name = "ingress-fc"
    }
    spec = {
      redirectToHttps = {
        enabled = true
      }
    }
  })
}

# GCE ingress with SSL
# Configure your routes here
resource "kubernetes_ingress_v1" "example" {
  wait_for_load_balancer = true
  metadata {
    name = "${var.name_prefix_kebab}-ingress"


    annotations = {
      "kubernetes.io/ingress.class"                 = "gce"
      "kubernetes.io/ingress.global-static-ip-name" = var.google_compute_global_address_ingress_name
      "cert-manager.io/cluster-issuer"              = var.cert_manager_cluster_issuer_name
      "networking.gke.io/v1beta1.FrontendConfig"    = kubectl_manifest.app_frontend_config.name
    }
  }

  spec {
    ingress_class_name = "gce"
    tls {
      hosts = [var.ingress_hosts.ftp_svc.domain]
      # hosts       = values(var.ingress_hosts)
      secret_name = var.cluster_issuer_private_key_secret_name
    }

    default_backend {
      service {
        name = var.kubernetes_service_v1_example.metadata.0.name
        port {
          number = var.kubernetes_service_v1_example.spec[0].port[0].port
        }
      }
    }

    rule {
      host = var.ingress_hosts.ftp_svc.domain
      http {
        path {
          path = "/*"
          backend {
            service {
              name = var.kubernetes_service_v1_example.metadata.0.name
              port {
                number = var.kubernetes_service_v1_example.spec[0].port[0].port
              }
            }
          }
        }
      }
    }
  }

  timeouts {
    create = "2m"
  }
}