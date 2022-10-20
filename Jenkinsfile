def credential = 'ade-test'
def server = 'ads@103.176.79.216'
def dir ='/home/ads/literature-frontend'
def branch = 'development'

pipeline{
    agent any
    stages{
        stage('Pull test'){
            steps{
                sshagent([credential]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${dir}
                    git config --global user.email muhamaddestar5@gmail.com
                    git config --global user.name ademuh
                    git pull origin ${branch}
                    exit
                    EOF"""
                    }
                }
            }
        }
    }
