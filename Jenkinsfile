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
	  stage('Building image') {
          steps {
		    script {
		    dockerImage = docker.build registry + ":latest"
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

	  stage('Clean Workspace') {
          steps{
            script {
              sh 'docker rmi saikirangude12/hello-world:latest'
          }
        }
      }

        stage('Kubernetes Deployment') {
        agent {
        label 'Jenkins_Node1'
        }
            steps{
	          git credentialsId: 'GitHub_Credentials', url: 'https://github.com/saikirangude110/Docker_Kubernetes_Deployment.git'
              sh 'gcloud auth activate-service-account --key-file=demo1-346508-c6caaf27f6f9.json'
	          sh 'gcloud container clusters get-credentials autopilot-cluster-1 --region us-central1 --project demo1-346508'
              sh 'helm install ./cvhello-world --generate-name'
        }
		  }

    }
}
