pipeline {
    agent none

    stages {
        stage ("test and build app") {
            agent {
                docker { image 'node:lts-alpine3.18' }
            }
            stages {
                stage("Install pnpm") {
                    steps {
                        sh "npm install -g pnpm"
                    }
                }
                stage("test") {
                    steps {
                        echo "testing..."
                    }
                }
                stage("Build") {
                    steps {
                        echo "Installing node packages"
                        sh "pnpm install"

                        echo "testing build of the application..."
                        sh "pnpm run build"
                    }
                }
            }
        }
        stage("Build and deploy docker app") {
            agent any
            stages {
                stage("Build image and push") {
                    steps {
                        script {
                            docker.build("devops-image")
                        }
                    }
                }
                stage("Deploy app") {
                    steps {
                        script {
                            sh "docker stop devops-app || true"
                            sh "docker rm devops-app || true"
                            sh "docker run -d -p 3000:3000 --name devops-app devops-image"
                        }
                    }
                }
            }
        }
    }
}