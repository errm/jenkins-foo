#!/usr/bin/groovy

podTemplate(
  label: 'build',
  containers: [
    containerTemplate(name: 'assemblyline', image: 'quay.io/assemblyline/alpine:3.5', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'docker', image: 'docker:17.04', command: 'cat', ttyEnabled: true),
  ],
  volumes:[
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]
){
  node('build') {
    stage('checkout') {
      container('assemblyline') {
        checkout scm
        sh "ls -la" 
      }
    }
    stage('build') {
      container('assemblyline') {
        sh "touch foo.txt"
        sh "exit 0"
      }
    }
    stage('docker build') {
      container('docker') {
        sh "ls"
        sh "docker ps"
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
        sh "ls -la" 
        sh "exit 0"
      }
    }
  }
}
