pipeline {
    agent any

    stages {
        stage ("build") {
            steps {
                echo "Installing node packages"
                sh "npm install"

                echo "testing build of the application..."
                sh "npm run build"
            }
        }
    }
}