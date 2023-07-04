pipeline {
    agent none

    stages {
        stage ("test and build app") {
            agent {
                docker { image 'node:lts-alpine3.18' }
            }
            stages {
                stage("test") {
                    steps {
                        echo "testing..."
                    }
                }
                stage("Build") {
                    steps {
                        echo "Installing node packages"
                        sh "npm install"

                        echo "testing build of the application..."
                        sh "npm run build"
                    }
                }
            }
        }
        stage("Deploy") {
            agent any
            steps {
                script {
                    docker.build("myapp").push()
                }
            }
        }
    }
}