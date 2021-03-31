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
                        sh 'mkdir -p build'
                        sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
                        sh 'echo linux x64 > concurrency'
                    } } }
                }
                stage('build windows x64') {
                    environment {
                        CROSS_TRIPLE='windows-x86_64'
                    }
                    steps { script { docker.image('dockcross/windows-static-x64').inside {
                        sh 'mkdir -p build'
                        sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}.exe"
                        sh 'echo win64 > concurrency'
                    } } }
                }
                stage('build linux arm64') {
                    environment {
                        CROSS_TRIPLE='aarch64-unknown-linux-gnu'
                    }
                    steps { script { docker.image('dockcross/linux-arm64').inside {
                        sh 'mkdir -p build'
                        sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
                        sh 'echo arm64 > concurrency'
                    } } }
                }
//              stage('build mac x64') {
//                  environment {
//                      CROSS_TRIPLE='x86_64-apple-darwin'
//                  }
//                  agent { docker {
//                      image 'multiarch/crossbuild'
//                      args "-e CROSS_TRIPLE=${CROSS_TRIPLE}"
//                  } }
//                  steps {
//                      sh 'mkdir -p build'
//                      sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
//                  }
//              }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'build/gaming_x86_64-unknown-linux-gnu', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming_windows-x86_64.exe', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming_aarch64-unknown-linux-gnu', fingerprint: true
            archiveArtifacts artifacts: 'concurrency', fingerprint: true
            deleteDir()
        }
    }
}

