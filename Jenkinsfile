pipeline {
    agent any
    stages {
        stage('build') {
            parallel {
                stage('build linux-x64') {
                    agent { docker { image 'dockcross/linux-x64' } }
                    steps {
                        sh 'mkdir -p build'
                        sh 'cc main.c -o build/gaming'
                    }
                }
                stage('build windows-x64') {
                    agent { docker { image 'dockcross/windows-static-x64' } }
                    steps {
                        sh 'mkdir -p build'
                        sh 'cc main.c -o build/gaming.exe'
                    }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'build/gaming', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming.exe', fingerprint: true
        }
    }
}

