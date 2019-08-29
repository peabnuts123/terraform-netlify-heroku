# Terraform with Netlify and Heroku

This is an example [Terraform](https://www.terraform.io/) project hosting a web app in [Netlify](http://netlify.com) and a web api in [Heroku](https://heroku.com). Terraform is used to manage and deploy the infrastructure.

The actual projects being deployed are two other repos of mine:

  - [dummy-web-app](https://github.com/peabnuts123/dummy-web-app)
    - A simple dummy web app which reaches out to a server for some information
  - [dummy-web-api](https://github.com/peabnuts123/dummy-web-api)
    - A simple dummy web API that serves some information

The inclusion of these sub-projects is done through [meta](https://github.com/mateodelnorte/meta). The idea is that these projects are not meant to be developed as a part of this repo, just included and deployed.

## Prerequisites

You will need to have the following in order to begin
 - [Node.js](https://nodejs.org) installed (for running and installing `meta`)
 - `npm i -g meta` to install `meta`
 - Terraform installed and available in your path

## Setting up and deploying the project

1. Clone this repo using `git clone ...`
1. Clone the subprojects using `meta git update`
1. Set up Terraform variables using `cp example.tfvars terraform.tfvars` and filling out the values in the `terraform.tfvars` file
1. Initialize Terraform using `terraform init` (this will install providers)
1. Run `terraform plan` to see what changes will be made
1. Run `terraform apply` and then type `yes` to deploy the configuration!

## Running the project locally

The npm project is set up to run the client and the server locally.

1. Ensure the projects are installed using `npm install` (this will also install dependencies for `client` and `server` projects)
1. Run `npm start` to run both the client and the server
  - You can run just the server or the client by running `npm run start:server` or `npm run start:client`

## Destroying the deployed infrastructure

You can simply tear down all your infrastructure with `terraform destroy`. It will preview the changes and ask for your permission before doing any destructive actions.