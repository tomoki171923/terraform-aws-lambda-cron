variable "name" {
  description = "aws cloudwatch event rule name"
  type        = string
  default     = ""
}

variable "description" {
  description = "aws cloudwatch event rule description"
  type        = string
  default     = ""
}

variable "schedule_expression" {
  description = "aws cloudwatch event rule schedule_expression"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "input" {
  description = "aws cloudwatch event target input"
  type        = string
  default     = ""
}

variable "lambda_alias_arn" {
  description = "aws lambda alias arn"
  type        = string
  default     = ""
}

variable "lambda_alias_name" {
  description = "aws lambda alias name"
  type        = string
  default     = ""
}

variable "lambda_function_name" {
  description = "aws lambda function name"
  type        = string
  default     = ""
}
