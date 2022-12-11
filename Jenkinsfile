pipeline {

  agent any
  
  environment{
    DOCKERHUB_CREDENTIALS = credentials('dockerHub')
    
   
  }
  stages {
      stage('Checkout Git'){
            steps{
                echo 'Pulling...';
                git branch : 'bilel',
                url : 'https://github.com/Wiiem271/devops1.git'
            }
        }
   
        stage('Cleaning the Project') {
         steps {
          sh 'echo "Clean the Project is processing ...."'
          sh 'mvn clean'
           }
    }
	  stage("Build") {
steps {
sh " mvn compile"
}}
 stage('Docker build') {
    agent any
      steps {
        sh 'echo "building docker...."'
      sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/achatbilel .'
      }
  }
    stage('Login'){
      agent any
      steps{
        sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW '
      }
    }
    
   stage('Docker push') {
    agent any
      steps {
        sh 'echo "Docker is pushing ...."'
      sh 'docker push $DOCKERHUB_CREDENTIALS_USR/achatbilel'
      }
  } 
	  
   
  stage("Sonar") {
steps {
sh ''' mvn sonar:sonar \
                    -Dsonar.host.url=http://localhost:9000 \
                    -Dsonar.login=64cc95cb7f0a69246acea3e81f9ff694ac6b29b4 '''

}}
        stage('MVN PACKAGE') {
            steps {
                sh 'mvn -DskipTests clean package' 
            }
        }
        stage('MVN TEST') {
                steps {
                sh 'mvn test'
                    
                }
                
            }  
	stage('Deploy to Nexus') {
              steps {
                sh 'mvn deploy -e'
               
            }
            }	
            stage('Docker compose stage') {
          
            steps {
            sh 'docker-compose up -d'
               
            }
        }
    
   
  
  }
   post {
        success {
             mail to: "devops.2223@gmail.com",
                    subject: "Build sucess",
                    body: "sucess"
            echo 'successful'
        }
        failure {
             mail to: "devops.2223@gmail.com",
                    subject: "Build failed",
                    body: "failed"
            echo 'failed'
        }
      }
    
}    
