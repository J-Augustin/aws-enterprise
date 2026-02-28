variable "accounts" {
  description = "Map of accounts to create."
  type = map(object({
    name = string
    email = string
    parent_ou = string
  }))
}

