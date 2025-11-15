pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-cred') // Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-cred') // Same Jenkins credentials ID
        AWS_DEFAULT_REGION    = "us-east-1"
    }

    stages {

        stage('Checkout Development Branch') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/development']],
                    userRemoteConfigs: [[url: 'https://github.com/Tudumu-0509/web-application.git']]
                ])
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform-jenkins') {
                    // -input=false avoids interactive prompt
                    sh 'terraform init -input=false -backend-config="bucket=ganeshtudumu-s3bucket-123458" -backend-config="key=terraform.tfstate" -backend-config="region=us-east-1"'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform-jenkins') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Do you want to launch EC2 instance?"
                dir('terraform-jenkins') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        success {
            echo '✅ EC2 Instance launched successfully!'
        }
        failure {
            echo '❌ Terraform failed! Check logs.'
        }
    }
}
