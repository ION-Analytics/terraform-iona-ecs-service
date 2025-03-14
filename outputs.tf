output "task_role_arn" {
  value = module.taskdef.task_role_arn
}

output "task_role_name" {
  value = module.taskdef.task_role_name
}

output "taskdef_arn" {
  value = module.taskdef.arn
}

output "stdout_name" {
  value = aws_cloudwatch_log_group.stdout.name
}

output "stderr_name" {
  value = aws_cloudwatch_log_group.stderr.name
}

output "full_service_name" {
  value = local.full_service_name
}

output "use_graviton" {
  value = local.use_graviton
}

output "DEBUG-container_def" {
  value = jsondecode(module.service_container_definition.rendered)
}

output "DEBUG-env" {
  value = module.service_container_definition.DEBUG-env
}

output "DEBUG-container-env" {
 value = module.service_container_definition.DEBUG-container-env
}

output "DEBUG-metadata" {
  value = module.service_container_definition.DEBUG-metadata
}
