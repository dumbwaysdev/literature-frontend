def credential = 'ade-test'
def server = 'ads@103.176.79.216'
def directory ='/home/ads/literature-frontend'
def branch = 'production'

pipeline{
    agent any
    stages{
        stage('Pull test'){
            steps{
                sshagent([credential]){
                    ssh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    git pull origin ${branch}
                    exit
                    EOF"""
                    }
                }
            }
        }
    }
}
