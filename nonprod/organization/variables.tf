variable "location" {
  description = "Location name for this environment"
  type        = string
  default     = "polandcentral"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "nonprod"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "forgeops"
}