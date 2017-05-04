#!/usr/bin/groovy

podTemplate(
  label: 'build',
  containers: [
    containerTemplate(name: 'assemblyline', image: 'quay.io/assemblyline/alpine:3.5', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'docker', image: 'docker:1.11.1', command: 'cat', ttyEnabled: true),
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
        sh """
          echo "some text" > foo.txt
        """
      }
    }
    stage('docker build') {
      container('docker') {
        sh """
          docker build -t quay.io/foo/bar:abc .
        """
      }
    }
  }
}

podTemplate(label: 'testing', containers: [
  containerTemplate(name: 'under-test', image: 'quay.io/foo/bar:abc', command: 'cat', ttyEnabled: true),
]){
  node('testing') {
    stage('test') {
      container('under-test') {
        sh "echo /foo.txt"
      }
    }
  }
}
