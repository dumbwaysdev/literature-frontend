def branch = "production"
def rname = "origin"
def dir = "~/literature-fe/"
def credential = 'appserver'
def server = 'ade@103.187.146.122'
def img = 'aimingds/literature-fe'
def cont = 'literature-fe'

pipeline {
    agent any

    stages {
        stage('Repository Pull') {
            steps {
                sshagent([credential]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    echo "Pulling Wayshub Backend Repository"
                    cd ${dir}
                    docker container stop ${cont}
                    docker image rm ${cont}:latest
                    git pull ${rname} ${branch}
                    exit
                    EOF"""
                }
            }
        }

        stage('Building Docker Image') {
            steps {
                sshagent([credential]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    echo "Building Image"
                    cd ${dir}
                    docker build -t ${img}:${env.BUILD_ID} .
                    exit
                    EOF"""
                }
            }
        }

        stage('Image Deployment') {
            steps {
                sshagent([credential]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${dir}
                    docker tag ${img}:${env.BUILD_ID} ${img}:latest
                    docker run ${img}:latest
                    exit
                    EOF"""
                }
            }
        }

        stage('Pushing to Docker Hub (aimingds)') {
            steps {
                sshagent([credential]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${dir}
                    docker image push ${img}:latest
                    exit
                    EOF"""
                }
            }
        }
        stage('Push Notification Discord') {
           steps {
                sshagent([credential]){
                    discordSend description: "wayshub-backend:" + BUILD_ID, footer: "Kelompok 2 - Dumbways.id Devops Batch 13", link: BUILD_URL, result: currentBuild.currentResult, scmWebUrl: '', title: 'Wayshub-backend', webhookURL: 'https://discord.com/api/webhooks/10>                }
            }
        }
    }
}

