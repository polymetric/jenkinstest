pipeline {
    agent any
    stages {
//        stage('build') {
//            parallel {
          stage('build linux-x64') {
              agent { docker { image 'dockcross/linux-x64' } }
              steps {
                  sh 'mkdir -p build/'
                  sh 'echo beef gaming asdF4hasgdhasdghAS > build/gaming'
              }
          }
//                stage('build windows-x64') {
//                    agent { docker { image 'dockcross/windows-static-x64' } }
//                    steps {
//                        sh 'touch win64'
//                        sh 'mkdir -p build'
//                        sh '$CC main.c -o build/gaming.exe'
//                        sh 'ls build'
//                    }
//                }
//            }
//        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'build/gaming', fingerprint: true
//            archiveArtifacts artifacts: 'build/gaming.exe', fingerprint: true
        }
    }
}

