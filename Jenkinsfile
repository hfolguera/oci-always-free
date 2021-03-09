pipeline {
  agent {
    node {
      label 'terraform-agent'
    }

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
        sh 'echo \'Terraform ${TERRAFORM_CMD}\''
        container(name: 'terraform-agent') {
          sh 'terraform plan'
        }

      }
    }

    stage('Terraform apply') {
      steps {
        sh 'echo \'Terraform apply\''
        container(name: 'terraform-agent') {
          sh 'terraform apply'
        }

      }
    }

  }
}