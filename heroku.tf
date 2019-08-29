# VARIABLES
variable "heroku_api_key" {
  type        = "string"
  description = "Heroku API Key"
}
variable "heroku_app_name" {
  type        = "string"
  description = "Heroku app name"
}


# PROVIDER
provider "heroku" {
  email   = "peabnuts123@gmail.com"
  api_key = "${var.heroku_api_key}"
}


# RESOURCES
# Application
resource "heroku_app" "dummy-web-api" {
  name   = "${var.heroku_app_name}"
  region = "us"
  buildpacks = [
    "heroku/nodejs" # runs `npm run build`
  ]

  config_vars = {
    CORS_ORIGIN = "https://${var.netlify_site_name}.netlify.com"
  }
}

# Build & release to the app
resource "heroku_build" "dummy-web-api" {
  app = "${heroku_app.dummy-web-api.name}"

  source = {
    path = "./server" # upload local directory
  }
}

# Launch the app's web process by scaling-up
resource "heroku_formation" "dummy-web-api" {
  app        = "${heroku_app.dummy-web-api.name}"
  type       = "web"
  quantity   = 1
  size       = "free"
  depends_on = ["heroku_build.dummy-web-api"]
}

output "app_url" {
  value = "https://${var.heroku_app_name}.herokuapp.com"
}
