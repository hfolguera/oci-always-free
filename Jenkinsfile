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
        sh 'echo \'Terraform init\''
        sh 'terraform init'
        sleep(unit: 'MINUTES', time: 5)
      }
    }

    stage('Terraform plan') {
      environment {
        TERRAFORM_CMD = 'plan'
      }
      steps {
        sh 'echo \'Terraform ${TERRAFORM_CMD}\''
        sh '/bin/terraform plan'
      }
    }

    stage('Terraform apply') {
      environment {
        TERRAFORM_CMD = 'apply'
      }
      steps {
        sh 'echo \'Terraform ${TERRAFORM_CMD}\''
        sh '/bin/terraform apply'
      }
    }

  }
}