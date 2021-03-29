pipeline {
    agent { docker { image 'alpine' } }
    stages {
        stage('build') {
            steps {
                sh 'echo now this is epic'
            }
        }
    }
    agent { docker { image 'alpine' } }
    stages {
        stage('build') {
            steps {
                sh 'second pipeline test'
            }
        }
    }
}

