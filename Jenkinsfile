pipeline {
    agent none
    stages {
        stage('build linux-x64') {
            agent { docker { image 'dockcross/linux-x64' } }
            steps {
                sh 'echo beef gaming what the fuc k did you gjust fucking say about me you piece of gaming > gaming'
            }
        }
    }

    post {
        always {
            agent any
            archiveArtifacts artifacts: 'gaming', fingerprint: true
            deleteDir()
        }
    }
}

