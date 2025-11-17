pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:$PATH"   // Add AWS CLI location
        AWS_ACCESS_KEY_ID     = credentials('aws-cred') // Jenkins credentials ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-cred')
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
                    sh '''
                        terraform init -backend-config="bucket=ganeshtudumu-s3bucket-123458" \
                                       -backend-config="key=terraform-state/terraform.tfstate" \
                                       -backend-config="region=us-east-1" \
                                       -force-copy
                    '''
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
                dir('terraform-jenkins') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        success {
            echo '✅ EC2 Instance and S3 Bucket created successfully!'
        }
        failure {
            echo '❌ Terraform failed! Check logs.'
        }
    }
}
