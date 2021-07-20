pipeline {
  agent {
    node {
      label 'terraform-agent'
    }

  }
  environment {
    TF_VAR_tenancy_ocid=credentials('OCI_HFOLGUERA_TENANT_OCID')
    TF_VAR_user_ocid=credentials('OCI_HFOLGUERA_USER_OCID')
    TF_VAR_fingerprint=credentials('OCI_HFOLGUERA_FINGERPRINT_OCID')
    TF_VAR_private_key_path="/home/jenkins/agent/.oci/ssh/id_rsa.pem"
    TF_VAR_region='eu-frankfurt-1'
    TF_VAR_compartment_ocid=credentials('OCI_HFOLGUERA_COMPARTMENT_OCID')
    TF_VAR_sys_password='welcome1'
  }
  stages {
    stage('Terraform init') {
      steps {
        echo 'Terraform init'
        container(name: 'terraform-agent') {
            sh 'terraform init'
        }
      }
    }

    stage('Terraform plan') {
      steps {
        container(name: 'terraform-agent') {
          sh 'terraform plan'
        }

      }
    }

    stage('Terraform apply') {
      steps {
        container(name: 'terraform-agent') {
          sh 'terraform apply -auto-approve'
        }

      }
    }

  }
}