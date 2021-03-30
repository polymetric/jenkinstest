pipeline {
    agent any
    stages {
        stage('build linux-x64') {
            agent { docker { image 'dockcross/linux-x64' } }
            steps {
                sh 'echo ddhfjfhjfhjhjhjhjhjhjhjh > gaming'
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

