variable "engine_name" {
  description = "Database engine name"
  type        = string
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
}

variable "instance_class" {
  description = "Database instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Database allocated storage"
  type        = number
}

variable "storage_type" {
  description = "Database storage type"
  type        = string
}

variable "identifier" {
  description = "Database storage type"
  type        = string
}

variable "username" {
  description = "Database username"
  type        = string
}

variable "password" {
  description = "Database password"
  type        = string
}

variable "publicly_accessible" {
  description = "Database publicly_accessible"
  type        = bool
}

variable "final_snapshot" {
  description = "Database skip final snapshot wuen deleted"
  type        = bool
}
