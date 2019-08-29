# VARIABLES
variable "netlify_token" {
  type        = "string"
  description = "Netlify Personal Access Token"
}

variable "netlify_site_name" {
  type        = "string"
  description = "Netlify site name"
}

# PROVIDER
provider "netlify" {
  token = "${var.netlify_token}"
}


# RESOURCES
# Site
resource "netlify_site" "dummy-web-app" {
  name = "${var.netlify_site_name}"

  repo {
    command       = "API_URL='https://${heroku_app.dummy-web-api.name}.herokuapp.com' ./node_modules/.bin/preact build"
    dir           = "/build"
    provider      = "github"
    repo_path     = "peabnuts123/dummy-web-app"
    repo_branch   = "master"
  }

  depends_on = ["heroku_app.dummy-web-api"]
}

output "site_url" {
  value = "https://${var.netlify_site_name}.netlify.com"
}
