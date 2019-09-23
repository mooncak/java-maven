pipeline {
  agent any
  stages {
    stage('echo') {
      parallel {
        stage('echo') {
          steps {
            sh 'echo "123"'
          }
        }
        stage('cd /src') {
          steps {
            echo 'hello world'
          }
        }
      }
    }
    stage('sleep') {
      steps {
        sleep(time: 5, unit: 'SECONDS')
      }
    }
    stage('send email') {
      steps {
        emailext(subject: 'jenkins pipeline', body: 'jenkins pipeline test', to: 'zml20120214@163.com', from: 'zml20120214@163.com')
      }
    }
    stage('build pkg') {
      steps {
        archiveArtifacts(artifacts: 'src/main/java/snow/*.java', allowEmptyArchive: true, caseSensitive: true, defaultExcludes: true)
      }
    }
  }
}