provider "aws" {
  region = "us-east-1"
}
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
#need to replace token and check for secure way to save
provider "github" {
  token = var.github_token
}
resource "github_repository" "terraform_project" {
  name        = var.github_repo
  description = "This repository created by terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_branch_default" "default_main" {
  repository = github_repository.terraform_project.name
  branch     = var.github_main_branch
}

