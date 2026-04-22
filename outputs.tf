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

output "capacity_providers" {
  value = local.capacity_providers
}

output "schedule_arns" {
  description = "Map of schedule name to EventBridge Scheduler schedule ARN. Empty when service_type is not \"scheduled_task\"."
  value = {
    for name, schedule in aws_scheduler_schedule.scheduled_task :
    name => schedule.arn
  }
}

output "scheduler_role_arn" {
  description = "ARN of the IAM role used by EventBridge Scheduler. Empty string when service_type is not \"scheduled_task\"."
  value       = var.service_type == "scheduled_task" ? aws_iam_role.scheduler_role[0].arn : ""
}
