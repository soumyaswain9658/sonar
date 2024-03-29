pipeline{
    agent any
    tools{
        jdk 'jdk17'
        maven 'maven3.9'
    }
    
    stages {
        stage('clean workspace'){
            steps{
                cleanWs()
            }
        }
        stage('Checkout from Git'){
            steps{
                git branch: 'main', credentialsId: 'git_cred', url: 'https://github.com/soumyaswain9658/sonar'
            }
        }
        
        stage('build in maven'){
            steps{
                sh 'mvn clean package'
            }
        }

        stage('build and push in docker '){
            steps{
               script{
                  withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
        
                    sh "docker build -t netflix1 ."
                    sh "docker tag netflix1 chiku1234/netflix1:version1"
                    sh "docker push chiku1234/netflix1:version1"
            }
               }
        }

    }
        stage('Deploy to container'){
            steps{
                sh 'docker run -d --name netflix1 -p 8081:80 chiku1234/netflix1:version1'
            }
        }
  }

}
