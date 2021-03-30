pipeline {
    agent none
    stages {
        stage('buildy mcbuildscript') {
            agent { docker { image 'alpine' } }
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

