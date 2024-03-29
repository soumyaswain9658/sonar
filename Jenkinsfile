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

    

    }


}