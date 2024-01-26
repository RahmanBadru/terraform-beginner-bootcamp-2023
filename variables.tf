variable "user_uuid" {
  description = "The UUID of the user"
  type = string

  validation {
    condition = length(var.user_uuid) >= 10
    error_message = "user_uuid must be a valid UUID format"
  }
}