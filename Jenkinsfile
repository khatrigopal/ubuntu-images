pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
        }

        stage('Build') { 
            steps { 
                script{
                 app = docker.build("jenkins-ubuntu-nginx")
                }
            }
        }
        stage('Test'){
            steps {
                sh 'wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb'
                sh sudo dpkg -i trivy_0.18.3_Linux-64bit.deb
                trivy image jenkins-ubuntu-nginx:latest || exit 0
            }
        }
        stage('Deploy') {
            steps {
                script{
                        docker.withRegistry('https://017187748261.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:sudhamsd') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
    }
}
