pipeline {
    agent any
    stages {
        agent none
        stage('build linux-x64') {
            agent { docker { image 'dockcross/linux-x64' } }
            steps {
                sh 'echo beef gaming shiD > gaming'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'gaming', fingerprint: true
            deleteDir()
        }
    }
}

