pipeline {
    agent none
    stages {
        stage('build') {
            parallel {
                stage('build alpine stage 1') {
                    agent { docker { image 'alpine' } }
                    steps {
                        sh 'ls'
                    }
                }
                stage('build debian stage 2') {
                    agent { docker { image 'debian' } }
                    steps {
                        sh 'ls'
                    }
                }
            }
        }
    }
}

