pipeline {
    agent any
    stages {
        stage('build') {
            parallel {
                stage('build linux x64') {
                    steps {
                        sh 'mkdir -p build/'
                        sh 'dockcross-linux-x64 bash -c \'$CC main.c -o build/main\''
                    }
                }
                stage('build windows x64') {
                    steps {
                        sh 'mkdir -p build/'
                        sh 'dockcross-windows-static-x64 bash -c \'$CC main.c -o build/main\''
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

