locals {
  sufix = "${var.tags.Env}-${var.tags.project}-${var.tags.region}"
}
locals {
  sufix-s3 = "${var.tags.region}-${random_string.random.id}"
}

resource "random_string" "random" {
  length  = 4
  special = false
  lower   = true
  upper = false
  numeric = false
}
