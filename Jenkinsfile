pipeline {
  agent {
    node {
      label 'terraform-agent'
    }

  }
  environment {
    TF_VAR_tenancy_ocid=credentials('OCI_HFOLGUERA_TENANT_OCID')
    TF_VAR_private_key_path="$WORKSPACE/.oci/jenkins.pem"
    TF_VAR_region='eu-frankfurt-1'
    TF_VAR_compartment_ocid=credentials('OCI_HFOLGUERA_COMPARTMENT_OCID')
    TF_VAR_sys_password='welcome1'
  }
  stages {
    stage('Terraform init') {
      steps {
        echo 'Terraform init'
        withCredentials([sshUserPrivateKey(
            credentialsId: 'hfolguera-pem-sshkey',
            keyFileVariable: 'SSH_KEY')])
        {
          sh 'mkdir .oci'
          sh 'cp "$SSH_KEY" .oci/jenkins.pem'
        }
        container(name: 'terraform-agent') {
          sh 'terraform init'
        }

      }
    }

    stage('Terraform plan') {
      steps {
        sh 'ls -lh'
        container(name: 'terraform-agent') {
          sh 'terraform -v'
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