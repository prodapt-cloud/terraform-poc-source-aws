"locals" = {
  "tags_cycloid" = {
    "cycloid.io" = "true"

    "env" = "${var.env}"
  }

  "tags_stack" = {}
}

"provider" "aws" {
  "region" = "us-east-1"
}

"resource" "aws_ami" "webserver" {
  "name" = "webserver"

  "tags" = {
    "cycloid.io" = "true"

    "env" = "${var.env}"
  }
}

"resource" "aws_ec2_availability_zone_group" "webavailabiltygroup" {
  "count" = 3

  "group_name" = "webservergroup"
}

"resource" "aws_elb" "web-loadbalancer" {
  "tags" = {
    "cycloid.io" = "true"

    "env" = "${var.env}"
  }
}

"variable" "env" {
  "default" = "[PLACEHOLDER]"

  "type" = "string"
}

"variable" "project" {
  "default" = "[PLACEHOLDER]"

  "type" = "string"
}
