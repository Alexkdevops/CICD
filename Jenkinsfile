podTemplate(yaml: """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: jenkins-slave
    image: mshaibek/jenkins-slave-312
    command:
    - cat
    tty: true
    env:
    - name: DOCKER_HOST
      value: 'tcp://localhost:2375'
  - name: dind-daemon
    image: 'docker:18-dind'
    command:
    - dockerd-entrypoint.sh
    tty: true
    securityContext:
      privileged: true    
"""
) {
    node(POD_LABEL) {
      // This is trigger for webhook in github!  
      properties([
	    pipelineTriggers([
          [$class: 'GitHubPushTrigger'],
          pollSCM('*/1 * * * *'),
	      ])
	    ])  
      checkout scm  
      container('jenkins-slave') {
        // sh "hostname ; sleep 5"
        sh '''
        ./deploy.sh
        '''
      }
    }
}