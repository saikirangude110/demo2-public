pipeline {
    agent { label 'Jenkins_Node1' }
	
	environment {
          registry = "saikirangude12/hello-world"
          registryCredential = 'DockerHub'
	  latest = 'v5.0'
          dockerImage = ''
          PROJECT_ID = 'avi-new'
          CLUSTER_NAME = 'cluster-1'
          LOCATION = 'us-central1-c'
          CREDENTIALS_ID = 'avi-test'
          }
	
    stages {
	    stage('Scm Checkout1') {
		    steps {
			    git 'https://github.com/saikirangude110/demo2-public.git'
		 }
	    }
	    
	    stage('Cleaning Old Build History') {
		    steps {
                echo "Packaging Code..."
		        sh 'mvn clean'
	         }
	    }
               
        stage('Generating Artifact') {
	        steps {
                echo "Packaging Code..."
	            sh 'mvn package'
	         }
            }
	    
	 stage('Building image') {
                steps {
		script {
		dockerImage = docker.build registry + ":v7.0"
	        }
	    }
	}
	 
      stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
	    
    }
}
