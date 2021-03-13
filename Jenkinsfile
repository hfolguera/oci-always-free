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
        withCredentials([string(
            credentialsId: 'TERRAFORM_CLOUD_LOGIN_TOKEN',
            variable: 'LOGIN_TOKEN')])
        {
          sh 'if [ ! -d $HOME/.terraform.d ]; then mkdir $HOME/.terraform.d; fi'
          sh 'echo "{\"credentials\": {\"app.terraform.io\": {\"token\": \"$LOGIN_TOKEN\"}}}" > $HOME/.terraform.d/credentials.tfrc.json'
        }
        container(name: 'terraform-agent') {
          sh 'terraform login'
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