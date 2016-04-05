resource "openstack_fw_rule_v1" "rule_1" {
  name = "my-rule-1"
  description = "drop TELNET traffic"
  action = "deny"
  protocol = "tcp"
  destination_port = "23"
  enabled = "true"
}

resource "openstack_fw_rule_v1" "rule_2" {
  name = "my-rule-2"
  description = "drop NTP traffic"
  action = "deny"
  protocol = "udp"
  destination_port = "123"
  enabled = "false"
}

resource "openstack_fw_policy_v1" "policy_1" {
  region = ""
  name = "my-policy"
  rules = ["${openstack_fw_rule_v1.rule_1.id}",
           "${openstack_fw_rule_v1.rule_2.id}"]
}

resource "openstack_fw_firewall_v1" "firewall_1" {
  region = ""
  name = "my-firewall"
  policy_id = "${openstack_fw_policy_v1.policy_1.id}"
}
