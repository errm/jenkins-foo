#!/usr/bin/groovy
podTemplate(label: 'jenkins-pipeline', containers: [
  containerTemplate(name: 'assemblyline', image: 'quay.io/assemblyline/alpine:3.5', command: 'cat', ttyEnabled: true),
]){
  node ('jenkins-pipeline') {
    checkout scm
    sh "ls -la"
  }
}
