output "rendered" {
  value = data.template_file.container_definitions.rendered
}

output "DEBUG-env" {
  value = local.encoded_env
}

output "DEBUG-container-env" {
 value = var.container-env
}

output "DEBUG-metadata" {
  value = var.metadata
}
