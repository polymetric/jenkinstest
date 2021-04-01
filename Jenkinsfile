pipeline {
    agent any
    stages {
        stage('build') {
            parallel {
                stage('build linux x64') {
                    environment {
                        CROSS_TRIPLE='x86_64-unknown-linux-gnu'
                    }
                    steps { script { docker.image('dockcross/linux-x64').inside {
                        sh "./build.sh gaming_${CROSS_TRIPLE}"
                    } } }
                }
                stage('build windows x64') {
                    environment {
                        CROSS_TRIPLE='windows-x86_64'
                    }
                    steps { script { docker.image('dockcross/windows-static-x64').inside {
                        sh "./build.sh gaming_${CROSS_TRIPLE}"
                    } } }
                }
                stage('build linux arm64') {
                    environment {
                        CROSS_TRIPLE='aarch64-unknown-linux-gnu'
                    }
                    steps { script { docker.image('dockcross/linux-arm64').inside {
                        sh "./build.sh gaming_${CROSS_TRIPLE}"
                    } } }
                }
                stage('build mac x64') {
                    environment {
                        CROSS_TRIPLE='x86_64-apple-darwin'
                    }
                    steps { script { docker.image('multiarch/crossbuild').inside("-e CROSS_TRIPLE=${CROSS_TRIPLE}") {
                        sh "./build.sh gaming_${CROSS_TRIPLE}"
                    } } }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'build/gaming_x86_64-unknown-linux-gnu', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming_windows-x86_64.exe', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming_aarch64-unknown-linux-gnu', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming_x86_64-apple-darwin', fingerprint: true
            deleteDir()
        }
    }
}

