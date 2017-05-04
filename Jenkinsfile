#!/usr/bin/groovy

podTemplate(label: 'jenkins-pipeline', containers: [
  containerTemplate(name: 'assemblyline', image: 'quay.io/assemblyline/alpine:3.5', command: 'cat', ttyEnabled: true),
]){
  node('jenkins-pipeline') {
    stage('checkout') {
      container('assemblyline') {
        checkout scm
        sh "ls -la" 
      }
    }
    stage('tests') {
      container('assemblyline') {
        sh "exit 0"
      }
    }
  }
}

podTemplate(label: 'deployer', containers: [
  containerTemplate(name: 'assemblyline', image: 'quay.io/assemblyline/alpine:3.5', command: 'cat', ttyEnabled: true),
]){
  node('deployer') {
    stage('deploy') {
      container('assemblyline') {
        sh "echo 'deploying'"
        sh "exit 0"
      }
    }
  }
}
