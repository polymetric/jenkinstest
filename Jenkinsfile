pipeline {
    agent none
    stages {
        stage('build') {
            parallel {
                stage('build alpine stage 1') {
                    agent { docker { image 'alpine' } }
                    steps {
                        sh 'echo now this is epic'
                        sh 'uname -a'
                        sh 'cat /etc/os-release'
                    }
                }
                stage('build debian stage 2') {
                    agent { docker { image 'debian' } }
                    steps {
                        sh 'echo gaming gaming gaming gaming gmain g??????'
                        sh 'uname -a'
                        sh 'cat /etc/os-release'
                    }
                }
            }
        }
    }
}

