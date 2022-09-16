variable "owner" {
  default     = null
  type        = string
  description = "Owner/Organization name. Alternatively set GITHUB_OWNER"
}

variable "token" {
  default     = null
  type        = string
  description = "Set this to set your api/personal token. Alternatively set GITHUB_OWNER"
}


## Exports you can use instead:
# export GITHUB_OWNER=
# export GITHUB_OWNER=
# export COLLABORATOR_USERNAME=
# export COLLABORATOR_PERMISSION=