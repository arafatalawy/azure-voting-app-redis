pipeline {
   agent any

   stages {
      stage('Verify Branch') {
         steps {
            echo "$GIT_BRANCH"
         }
      }
      stage('Docker Build') {
         steps {
            sh(script: '''
            cd azure-vote/
            docker build -t jenkins-pipeline .
           cd .. ''')
         }
      }
      stage('Start App') {
         steps {
            sh(script: """
               docker ps -a
               docker-compose up -d
              sudo ./scripts/test_container.ps1
               """)
         }
      }
      stage('Run Tests') {
         steps {
             sh(script:'docker images -a')
            sh(script: '.pytest /tests/test_sample.py')
         }
         post {
            success {
               echo "Tests passed! "
            }
            failure {
               echo "Tests failed "
            }
         }
      }
   }
   post {
      always {
         sh(script: 'docker-compose down')
      }
   }
}
