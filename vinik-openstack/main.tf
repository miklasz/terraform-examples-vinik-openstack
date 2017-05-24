


# Configure the OpenStack Provider
provider "openstack" {
    user_name  = "admin"
    tenant_name = "admin"
    password  = "secret"
    auth_url  = "http://127.0.0.1:5000/v2.0"
}

resource "openstack_compute_keypair_v2" "test-keypair" {
  name = "my-keypair"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "openstack_compute_floatingip_v2" "floatip_1" {
  region = "nova"
  pool = "public"
}

resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name = "my_secgroup"
  description = "my security group"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}
