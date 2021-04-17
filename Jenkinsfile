pipeline {
    agent any
    stages {
        stage('build linux x64') {
            agent { docker { image 'dockcross/linux-x64' } }
            environment {
                CROSS_TRIPLE='x86_64-unknown-linux-gnu'
            }
            steps { 
                sh 'mkdir -p build'
                sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
                stash includes: "build/gaming_${CROSS_TRIPLE}", name: 'builtExecutables', allowEmpty: true
            }
        }
//      stage('build windows x64') {
//          environment {
//              CROSS_TRIPLE='windows-x86_64'
//          }
//          steps { script { docker.image('dockcross/windows-static-x64').inside {
//              sh 'mkdir -p build'
//              sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}.exe"
//              stash includes: "build/gaming_${CROSS_TRIPLE}", name: 'builtExecutables', allowEmpty: true
//          } } }
//      }
//      stage('build linux arm64') {
//          environment {
//              CROSS_TRIPLE='aarch64-unknown-linux-gnu'
//          }
//          steps { script { docker.image('dockcross/linux-arm64').inside {
//              sh 'mkdir -p build'
//              sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
//              stash includes: "build/gaming_${CROSS_TRIPLE}", name: 'builtExecutables', allowEmpty: true
//          } } }
//      }
//      stage('build mac x64') {
//          environment {
//              CROSS_TRIPLE='x86_64-apple-darwin'
//          }
//          steps { script { docker.image('multiarch/crossbuild').inside("-e CROSS_TRIPLE=${CROSS_TRIPLE}") {
//              sh 'mkdir -p build'
//              sh "cc main.c -o build/gaming_${CROSS_TRIPLE}"
//              stash includes: "build/gaming_${CROSS_TRIPLE}", name: 'builtExecutables', allowEmpty: true
//          } } }
//      }
    }

    post {
        always {
            unstash 'builtExecutables'
            sh 'tree'
            archiveArtifacts artifacts: 'build/gaming_x86_64-unknown-linux-gnu', fingerprint: true
//          archiveArtifacts artifacts: 'build/gaming_windows-x86_64.exe', fingerprint: true
//          archiveArtifacts artifacts: 'build/gaming_aarch64-unknown-linux-gnu', fingerprint: true
//          archiveArtifacts artifacts: 'build/gaming_x86_64-apple-darwin', fingerprint: true
            deleteDir()
        }
    }
}

