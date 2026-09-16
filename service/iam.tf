data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:Describe*",
      "elasticfilesystem:Describe*",
      "elasticfilesystem:ClientMount",
      "elasticfilesystem:List*",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:DeregisterTargets",
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "elasticloadbalancing:RegisterTargets",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "role" {
  name_prefix = join(
    "",
    slice(
      split("", var.name),
      0,
      length(var.name) > 31 ? 31 : length(var.name),
    ),
  )

  # from http://docs.aws.amazon.com/AmazonECS/latest/developerguide/service_IAM_role.html
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy" "policy" {
  role = aws_iam_role.role.id
  name_prefix = join(
    "",
    slice(
      split("", var.name),
      0,
      length(var.name) > 31 ? 31 : length(var.name),
    ),
  )

  # from http://docs.aws.amazon.com/AmazonECS/latest/developerguide/service_IAM_role.html (step 7)
  policy = data.aws_iam_policy_document.policy_document.json

}

