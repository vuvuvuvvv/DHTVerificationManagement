pipeline {
    agent any
    environment {
        COMPOSE_FILE = 'docker-compose.yml'
    }
    stages {
        stage('Clone Repositories') {
            steps {
                echo 'Cloning repositories...'
                dir('flask-verification-management') {
                    git branch: 'dev', credentialsId: 'github-credential', url: 'https://github.com/vuvuvuvvv/flask-verification-management.git'
                }
                dir('nextjs-verification-management') {
                    git branch: 'dev', credentialsId: 'github-credential', url: 'https://github.com/vuvuvuvvv/nextjs-verification-management.git'
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    echo 'Building Docker images...'
                    sh 'docker-compose -f ${COMPOSE_FILE} build'
                }
            }
        }
        stage('Deploy and Run Containers') {
            steps {
                script {
                    echo 'Deploying and running containers...'
                    sh 'docker-compose -f ${COMPOSE_FILE} down'
                    sh 'docker-compose -f ${COMPOSE_FILE} up -d'
                }
            }
        }
    }

    post {
        always {
            mail bcc: '', 
                body: "Build pipeline successfully.\n\n" +
                    "Detail: ${env.BUILD_URL}",
                cc: '', 
                from: '', 
                replyTo: '', 
                subject: "Jenkins Build Report: ${env.JOB_NAME} #${env.BUILD_NUMBER}", 
                to: 'nguyenvu260502@gmail.com'
        }
    }
}