resource "openstack_compute_servergroup_v2" "test-sg" {
  name = "test-sg"
  policies = ["affinity"]
}

resource "openstack_compute_instance_v2" "test-server" {
  name = "tf-test"
  image_id = "ad091b52-742f-469e-8f3c-fd81cadf0743"
  flavor_id = "3"
  metadata {
    this = "that"
  }
  key_pair = "my_key_pair_name"
  security_groups = ["test-group-1"]
}
