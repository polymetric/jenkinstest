pipeline {
    agent any
    stages {
        stage('build linux-x64') {
            agent { docker { image 'dockcross/linux-x64' } }
            steps {
                sh 'echo 91293712893712890371289037128903712 > gaming'
            }
        }
    }

    post {
        always {
            steps {
                sh 'ls'
            }
            archiveArtifacts artifacts: 'gaming', fingerprint: true
            deleteDir()
        }
    }
}

