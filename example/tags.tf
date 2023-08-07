module "tags" {
  source = "../tags"

  name              = "tf-modules-example"
  deployed_on       = "self"
  dedicated_cluster = "asd"
  environment       = "dev"
}
