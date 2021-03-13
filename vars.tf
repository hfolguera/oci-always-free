variable tenancy_ocid { 
    description = "Tenant OCID"
}

variable region { 
    default = "eu-frankfurt-1" 
    description = "OCI Region"
}

variable compartment_ocid {
    description = "Compartment OCID where resources will be deployed"
}

variable ssh_public_keys {
    type    = list(string)
    default = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8P7aGIPCzbLBgiZlI7TRJ+EJb8/QXbeNevtha3HvABlNtrTFLYCNk4osryyXNuLu5eH9xLcyRFVWV1Uy4NOC/HCcCLc86E3IGN+M2Q68MY/Q2ZgCL8pEWOxC5OZ2sbp3B1535YiBKY8pz6eWdlAm+4w+RwQb8I0iNs1LJGzKnqQhVpd+wsIv5fxmb7cOW7uGADIRe+w3BwrUUqWJY7SqzNpmHVJj6sqWgbUHLeE2o/8QyDU0nkBdm0csLEijIoiPZ8QKXAyWnzNWlEHzpVWPTceeiWULu72Axxlz+UbCGJv9aIL2vdQ7e9g9LN9985PTAJPUeAhVkUKbwOCzh0wQb hufolgue@Hugs-MacBook-Pro.local"]
    description = "SSH Public keys to be configured on VMs"
}

variable sys_password { 
    description = "SYS Password"
    #sensitive = true
}

variable private_key_path {
    default = "/Users/hfolguera/.ssh/id_rsa.pem"
    description = "Path with the Private SSH key used to connect to OCI"
}

variable user_ocid {
    description = "User OCID"
}

variable fingerprint {
    description = "User fingerprint"
}