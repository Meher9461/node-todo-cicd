pipeline {
    agent { label 'dev' }

    stages {

        stage ('Code') {
            steps {
                git url: 'https://github.com/Meher9461/node-todo-cicd.git', branch: 'master'
            }
        }
        
        stage ('Build & Test') {
            steps {
                echo 'Build & Test'
                sh 'docker build . -t meher9461/node_to_do_app:latest'
            }
        }
        
        stage ('Login & Push Image') {
            steps {
                echo 'Logging in to docker hub and pushing image'
                withCredentials([usernamePassword('credentialsId':'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh "docker image push meher9461/node_to_do_app:latest"
                }
            }
        }
        
        stage ('Deploy') {
            steps {
                echo 'Deploying'
                sh 'docker-compose down && docker-compose up -d'
            }
        }

    }
}
