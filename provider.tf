variable "netlify_token" {
  type        = "string"
  description = "Netlify Personal Access Token"
  default     = ""
}

provider "netlify" {
  token = "${var.netlify_token}"
}
