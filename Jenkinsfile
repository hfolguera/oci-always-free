pipeline {
  agent {
    docker {
      image 'hashicorp/terraform:latest'
    }

  }
  stages {
    stage('Terraform init') {
      steps {
        sh '''echo \'Terraform init\'
terraform init'''
      }
    }

    stage('Terraform plan') {
      steps {
        sh 'echo \'Terraform plan\''
      }
    }

    stage('Terraform apply') {
      steps {
        sh 'echo \'Terraform apply\''
      }
    }

  }
}