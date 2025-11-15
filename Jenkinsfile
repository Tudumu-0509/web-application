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

        stage('Ensure S3 Bucket for Terraform State') {
            steps {
                script {
                    sh '''
                        aws s3api head-bucket --bucket ganeshtudumu-s3bucket-123458 2>/dev/null || \
                        aws s3api create-bucket --bucket ganeshtudumu-s3bucket-123458 --region us-east-1 --create-bucket-configuration LocationConstraint=us-east-1
                    '''
                }
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
