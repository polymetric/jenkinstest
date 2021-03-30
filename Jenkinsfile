pipeline {
    agent none
    stages {
        stage('buildy mcbuildscript') {
            agent { docker { image 'alpine' } }
            steps {
                sh 'echo 9e0ee0ee00ee0e00e00e > gaming'
            }
        }
    }

    post {
        always {
            node(null) {
                archiveArtifacts artifacts: 'gaming', fingerprint: true
                deleteDir()
            }
        }
    }
}

