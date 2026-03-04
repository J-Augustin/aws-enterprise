variable "policies" {
  description = "Map of SCP policies to create. Key is used as the resource identifier."
  type = map(object({
    name    = string
    content = string
  }))
}

variable "attachments" {
  description = "List of SCP policy attachments"
  type = list(object({
    policy_key = string
    target_id  = string
  }))
}

