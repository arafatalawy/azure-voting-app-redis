pipeline {
      agent {
        docker { image 'node:20.9.0-alpine3.18' }
    }

   stages {
                 stage('Test') {
            steps {
                sh 'node --version'
            }
      stage('Verify Branch') {
         steps {
            echo "$GIT_BRANCH"
         }
      }
      stage('Docker Build') {
         steps {
            sh(script: 'docker compose build')
         }
      }
   }
}
