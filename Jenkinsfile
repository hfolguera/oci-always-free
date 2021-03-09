pipeline {
  agent {
    node {
      label 'terraform-agent'
    }

  }
  stages {
    stage('Terraform init') {
      steps {
        container(name: 'terraform-agent') {
          sh 'terraform init'
        }

      }
    }

    stage('Terraform plan') {
      steps {
        sh 'echo \'Terraform ${TERRAFORM_CMD}\''
        sh '/bin/terraform plan'
      }
    }

    stage('Terraform apply') {
      steps {
        sh 'echo \'Terraform ${TERRAFORM_CMD}\''
        sh '/bin/terraform apply'
      }
    }

  }
}