variable "user_name" {
  default = "Kofi"
  type = string
  description = "iam user name "
}

variable "policy_name" {
    default =  "NanaPolicy"
    type = string
    description = "iam_policy_name"
}

variable "policy_arn" {
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
  type = string
  description = "the ARN of the iam policy"
}