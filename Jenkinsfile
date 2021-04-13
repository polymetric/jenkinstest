pipeline {
    agent any
    stages {
        stage('build linux x64') {
            environment {
                CROSS_TRIPLE='x86_64-unknown-linux-gnu'
            }
            steps { catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                script { docker.image('dockcross/linux-x64').inside {
                    sh 'mkdir -p build'
                    sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
                } }
            } }
        }
        stage('build windows x64') {
            environment {
                CROSS_TRIPLE='windows-x86_64'
            }
            steps { catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                script { docker.image('dockcross/windows-static-x64').inside {
                    sh 'mkdir -p build'
                    sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}.exe"
                } }
            } }
        }
        stage('build linux arm64') {
            environment {
                CROSS_TRIPLE='aarch64-unknown-linux-gnu'
            }
            steps { catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                script { docker.image('dockcross/linux-arm64').inside {
                    sh 'mkdir -p build'
                    sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
                } }
            } }
        }
        stage('build mac x64') {
            environment {
                CROSS_TRIPLE='x86_64-apple-darwin'
            }
            steps { catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                script { docker.image('multiarch/crossbuild').inside {
                    sh 'mkdir -p build'
                    sh "cc main.c -o build/gaming_${CROSS_TRIPLE}"
                } }
            } }
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

