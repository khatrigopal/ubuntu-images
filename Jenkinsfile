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
                    app = docker.build("jenkins-ubuntu-nginx:${env.BUILD_ID}")
                }
            }
        }
        stage('Test'){
            steps {
                sh 'trivy image jenkins-ubuntu-nginx:latest || exit 0'
            }
        }
        stage('Deploy') {
            steps {
                script{
                        docker.withRegistry('https://017187748261.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:sudhamsd') {
                    #app.push("${env.BUILD_NUMBER}")
                    app.push()
                    }
                }
            }
        }
    }
}
