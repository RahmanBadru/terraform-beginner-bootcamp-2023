terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "example-org-f8e12b"
    workspaces {
      name = "terra-house-sports"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  public_path = var.arcanum.public_path
  user_uuid = var.teacherseat_user_uuid
  content_version = var.arcanum.content_version
}

resource "terratowns_home" "home_arcanum" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  #domain_name = "3fdq3gz.cloudfront.net"
  town = "missingo"
  content_version = var.arcanum.content_version
}

module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  public_path= var.payday.public_path
  user_uuid = var.teacherseat_user_uuid
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Making your own payday bar"
  description = <<DESCRIPTION
Since I really like Payday candy bars but they cost so much to import
into Canada, I decided I would see how I could my own Paydays bars,
and if they are most cost effective.
DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  #domain_name = "3fdq3gz.cloudfront.net"
  town = "missingo"
  content_version = var.payday.content_version
}