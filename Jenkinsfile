pipeline {
    agent none
    stages {
        stage('build') {
            parallel {
                stage('build linux-x64') {
                    agent { docker { image 'dockcross/linux-x64' } }
                    steps {
                        sh 'mkdir -p build'
                        sh '$CC main.c -o build/gaming'
                    }
                }
                stage('build arm64') {
                    agent { docker { image 'dockcross/windows-static-x64' } }
                    steps {
                        sh 'mkdir -p build'
                        sh '$CC main.c -o build/gaming.exe'
                    }
                }
                stage('build windows-x64') {
                    agent { docker { image 'dockcross/arm64' } }
                    steps {
                        sh 'mkdir -p build'
                        sh '$CC main.c -o build/gaming.exe'
                    }
                }
            }
        }
    }

    post {
        always {
            node(null) {
                archiveArtifacts artifacts: 'build/gaming', fingerprint: true
                archiveArtifacts artifacts: 'build/gaming.exe', fingerprint: true
            }
        }
    }
}

