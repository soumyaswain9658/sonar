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
                    sh "docker build -t netflix1/chiku ."
                    #sh "docker tag netflix11 netflix1/chiku:latest "
                    sh "docker push netflix1/chiku "
            }
               }
        }

    }
  }

}
