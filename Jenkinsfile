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
             pwsh(scripts:'docker images -a')
            pwsh(scripts: """
            cd azure-vote/
            docker images -a
            docker build -t jenkins-pipeline .
            docker images -a
            cd ..
            """)
         }
      }
   }
}
