pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:$PATH"
        AWS_ACCESS_KEY_ID     = credentials('aws-cred')
        AWS_SECRET_ACCESS_KEY = credentials('aws-cred')
        AWS_DEFAULT_REGION    = "us-east-1"

        BACKEND_BUCKET = "terraform-backend-ganesh-bucket-001"   // backend bucket
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

        stage('Ensure Backend S3 Bucket Exists') {
            steps {
                script {
                    sh """
                    echo "Checking backend bucket: ${BACKEND_BUCKET} ..."
                    if aws s3api head-bucket --bucket ${BACKEND_BUCKET} 2>/dev/null; then
                        echo "Backend bucket already exists."
                    else
                        echo "Backend bucket does NOT exist. Creating..."
                        aws s3api create-bucket --bucket ${BACKEND_BUCKET} --region us-east-1
                        echo "Backend bucket created successfully!"
                    fi
                    """
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform-jenkins') {
                    sh """
                        terraform init \
                            -backend-config="bucket=${BACKEND_BUCKET}" \
                            -backend-config="key=terraform-state/terraform.tfstate" \
                            -backend-config="region=us-east-1"
                    """
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
            echo '✅ Terraform executed successfully!'
        }
        failure {
            echo '❌ Terraform failed! Check logs.'
        }
    }
}
