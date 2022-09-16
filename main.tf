terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

data "github_organization" "joshuaauger-testing" {
  name = var.owner
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"

  auto_init = true
}

resource "github_branch" "example-dev" {
  repository = "example"
  branch = "dev"
  depends_on = [
    github_repository.example
  ]
}

resource "github_branch" "test-branches" {
  for_each = toset(var.test_branches != null ? concat(local.default_branches, var.test_branches) : local.default_branches)
  branch = each.value
  repository = "test"
}

variable "test_branches" {
  default = []
  type = list
  description = "branches for branch test"
}

locals {
  default_branches = jsondecode(file("./data/default_branches.json"))
  ["main","dev","prod","qa","staging","staging-green"]
}

# Add a user to the owner
# resource "github_membership" "membership_for_user_x" {
#   # ...
# }