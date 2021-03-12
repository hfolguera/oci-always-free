resource oci_core_vcn "vcn01" {
    #Required
    cidr_block = "10.0.0.0/16"
    compartment_id = var.compartment_ocid

    #Optional
    defined_tags = {}
    display_name = "vcn01"
    dns_label = "vcn01"
    freeform_tags = {}
}

resource "oci_core_dhcp_options" "vcn01_dhcp" {
    #Required
    compartment_id = var.compartment_ocid
    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }

    options {
        type = "SearchDomain"
        search_domain_names = [ "vcn01.oraclevcn.com" ]
    }

    vcn_id = oci_core_vcn.vcn01.id

    #Optional
    display_name = "VCN01 DHCP Options"
}

resource oci_core_internet_gateway vcn01_internetgateway {
  compartment_id = var.compartment_ocid
  defined_tags   = {}

  display_name  = "vcn01_internetgateway"
  enabled       = "true"
  freeform_tags = {}

  vcn_id = oci_core_vcn.vcn01.id
}

resource "oci_core_route_table" "vcn01_rt" {
    #Required
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn01.id

    #Optional
    defined_tags = { }
    display_name = "VCN01 Route Table"
    freeform_tags = { }
    route_rules {
        #Required
        network_entity_id = oci_core_internet_gateway.vcn01_internetgateway.id

        #Optional
        #cidr_block = var.route_table_route_rules_cidr_block
        #description = var.route_table_route_rules_description
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }
}

resource "oci_core_security_list" "vcn01_sl" {
    #Required
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn01.id

    #Optional
    defined_tags = {}
    display_name = "VCN01 Security List"
    egress_security_rules {
      destination      = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"

      #icmp_options = <<Optional value not found in discovery>>
      protocol  = "all"
      stateless = "false"

      #tcp_options = <<Optional value not found in discovery>>
      #udp_options = <<Optional value not found in discovery>>
    }
    
    freeform_tags = {}
    
    ingress_security_rules {
      #icmp_options = <<Optional value not found in discovery>>
      protocol    = "6"
      source      = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      stateless   = "false"

      tcp_options {
        max = "22"
        min = "22"

        #source_port_range = <<Optional value not found in discovery>>
      }

      #udp_options = <<Optional value not found in discovery>>
    }

    ingress_security_rules {
      icmp_options {
        code = "4"
        type = "3"
      }

      protocol    = "1"
      source      = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      stateless   = "false"

      #tcp_options = <<Optional value not found in discovery>>
      #udp_options = <<Optional value not found in discovery>>
    }

    ingress_security_rules {
      icmp_options {
        code = "-1"
        type = "3"
      }

      protocol    = "1"
      source      = "10.0.0.0/16"
      source_type = "CIDR_BLOCK"
      stateless   = "false"

      #tcp_options = <<Optional value not found in discovery>>
      #udp_options = <<Optional value not found in discovery>>
    }

    ingress_security_rules {
      #icmp_options = <<Optional value not found in discovery>>
      protocol    = "6"
      source      = "10.0.0.0/24"
      source_type = "CIDR_BLOCK"
      stateless   = "false"

      tcp_options {
        max = "80"
        min = "80"

        #source_port_range = <<Optional value not found in discovery>>
      }

      #udp_options = <<Optional value not found in discovery>>
    }
}

resource "oci_core_subnet" "vcn01_subnet01" {
    #Required
    cidr_block = "10.0.1.0/24"
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn01.id

    #Optional
    #availability_domain = oci_identity_availability_domain.AD1.name
    defined_tags = {}
    dhcp_options_id = oci_core_dhcp_options.vcn01_dhcp.id
    display_name = "vcn01_subnet01"
    dns_label = "vcn01subnet01"
    freeform_tags = {}
    #ipv6cidr_block = var.subnet_ipv6cidr_block
    prohibit_public_ip_on_vnic = "false"
    route_table_id = oci_core_route_table.vcn01_rt.id
    security_list_ids = [
      oci_core_security_list.vcn01_sl.id,
    ]
}

resource "oci_core_subnet" "vcn01_subnet02" {
    #Required
    cidr_block = "10.0.2.0/24"
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn01.id

    #Optional
    #availability_domain = oci_identity_availability_domain.AD2.name
    defined_tags = {}
    dhcp_options_id = oci_core_dhcp_options.vcn01_dhcp.id
    display_name = "vcn01_subnet02"
    dns_label = "vcn01subnet02"
    freeform_tags = {}
    #ipv6cidr_block = var.subnet_ipv6cidr_block
    prohibit_public_ip_on_vnic = "false"
    route_table_id = oci_core_route_table.vcn01_rt.id
    security_list_ids = [
      oci_core_security_list.vcn01_sl.id,
    ]
}
