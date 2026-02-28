variable "feature_set" {
  description = "Feature set for AWS Organization"
  type        = string
  default     = "ALL"
}

variable "organizational_units" {
  description = "Map of OU names to create"
  type        = list(string)
}