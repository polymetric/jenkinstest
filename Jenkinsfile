pipeline {
    agent none
    stages {
          stage('build linux-x64') {
              agent { docker { image 'dockcross/linux-x64' } }
              steps {
                  sh 'echo beef gaming shiD > gaming'
              }
          }
    }

//    post {
//        always {
//            archiveArtifacts artifacts: 'gaming', fingerprint: true
//            deleteDir()
//        }
//    }
}

