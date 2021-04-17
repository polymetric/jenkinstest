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
                sh 'cc --version'
                sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
                stash includes: "build/gaming_${CROSS_TRIPLE}", name: 'bin linux x64'
            }
        }
        stage('build windows x64') {
            agent { docker { image 'dockcross/windows-static-x64' } }
            environment {
                CROSS_TRIPLE='windows-x86_64'
            }
            steps {
                sh 'mkdir -p build'
                sh 'cc --version'
                sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}.exe"
                stash includes: "build/gaming_${CROSS_TRIPLE}.exe", name: 'bin windows x64'
            }
        }
        stage('build linux arm64') {
            agent { docker { image 'dockcross/linux-arm64' } }
            environment {
                CROSS_TRIPLE='aarch64-unknown-linux-gnu'
            }
            steps {
                sh 'mkdir -p build'
                sh 'cc --version'
                sh "\$CC main.c -o build/gaming_${CROSS_TRIPLE}"
                stash includes: "build/gaming_${CROSS_TRIPLE}", name: 'bin linux arm64'
            }
        }
        stage('build mac x64') {
            agent { docker { image 'multiarch/crossbuild' } }
            environment {
                CROSS_TRIPLE='x86_64-apple-darwin'
            }
            steps { 
                bash '/usr/bin/crossbuild'
                bash 'mkdir -p build'
                bash 'cc --version'
                bash "cc main.c -o build/gaming_${CROSS_TRIPLE}"
                stash includes: "build/gaming_${CROSS_TRIPLE}", name: 'bin mac x64'
            }
        }
        stage('package') {
//          agent { docker { image 'alpine' } }
            steps {
                unstash 'bin linux x64'
                unstash 'bin windows x64'
                unstash 'bin linux arm64'
                unstash 'bin mac x64'
                sh 'tar cJvf gaming.tar.xz build/*'
                stash includes: "gaming.tar.xz", name: 'package'
            }
        }
    }

    post {
        always {
            unstash 'bin linux x64'
            unstash 'bin windows x64'
            unstash 'bin linux arm64'
            unstash 'bin mac x64'
            unstash 'package'
            archiveArtifacts artifacts: 'build/gaming_x86_64-unknown-linux-gnu', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming_windows-x86_64.exe', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming_aarch64-unknown-linux-gnu', fingerprint: true
            archiveArtifacts artifacts: 'build/gaming_x86_64-apple-darwin', fingerprint: true
            archiveArtifacts artifacts: 'gaming.tar.xz', fingerprint: true
            deleteDir()
        }
    }
}

