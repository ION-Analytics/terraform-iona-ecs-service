output "name" {
  value = join(
    "",
    compact(
      concat(
        aws_ecs_service.service.*.name
      )
    )
  )
}
