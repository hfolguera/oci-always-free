pipeline {
  agent {
    node {
      label 'terraform-agent'
    }

  }
  stages {
    stage('Terraform init') {
      environment {
        TERRAFORM_CMD = 'init'
      }
      steps {
        sh '''echo \'Terraform init\'
terraform init'''
      }
    }

    stage('Terraform plan') {
      environment {
        TERRAFORM_CMD = 'plan'
      }
      steps {
        sh 'echo \'Terraform plan\''
      }
    }

    stage('Terraform apply') {
      environment {
        TERRAFORM_CMD = 'apply'
      }
      steps {
        sh 'echo \'Terraform apply\''
      }
    }

  }
}