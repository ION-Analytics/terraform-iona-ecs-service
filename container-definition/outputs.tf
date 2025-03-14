output "rendered" {
  value = data.template_file.container_definitions.rendered
}

output "DEBUG-env" {
  value = local.encoded_env
}

