pipeline {
    agent any
    environment {
        COMPOSE_FILE = 'docker-compose.yml'
    }
    stages {
        stage('Clone Repositories') {
            steps {
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
                sh label: '', script: 'docker-compose -f ${COMPOSE_FILE} build'
            }
        }
        stage('Deploy and Run Containers') {
            steps {
                sh label: '', script: 'docker-compose -f ${COMPOSE_FILE} down'
                sh label: '', script: 'docker-compose -f ${COMPOSE_FILE} up -d'
            }
        }
    }

    post {
        success {
            mail bcc: '', 
                body: "Build pipeline successfully.\n\n" +
                    "Detail: ${env.BUILD_URL}",
                cc: '', 
                from: '', 
                replyTo: '', 
                subject: "Jenkins Build Report: ${env.JOB_NAME} #${env.BUILD_NUMBER}", 
                to: 'nguyenvu260502@gmail.com'
        }
        failure {
            mail bcc: '', 
                body: "Build pipeline failed.\n\n" +
                    "Detail: ${env.BUILD_URL}",
                cc: '', 
                from: '', 
                replyTo: '', 
                subject: "Jenkins Build Report: ${env.JOB_NAME} #${env.BUILD_NUMBER}", 
                to: 'nguyenvu260502@gmail.com'
        }
    }
}