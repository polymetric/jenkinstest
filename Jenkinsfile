pipeline {
    agent any
    stages {
        stage('build') {
            parallel {
                stage('build linux-x64') {
                    agent { docker { image 'dockcross/linux-x64' } }
                    steps {
                        sh 'touch linux64'
                        sh 'mkdir -p build'
                        sh '$CC main.c -o build/gaming'
                    }
                }
                stage('build windows-x64') {
                    agent { docker { image 'dockcross/windows-static-x64' } }
                    steps {
                        sh 'touch win64'
                        sh 'mkdir -p build'
                        sh '$CC main.c -o build/gaming.exe'
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'ls'
            archiveArtifacts artifacts: 'build/gaming', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming.exe', fingerprint: true
        }
    }
}

