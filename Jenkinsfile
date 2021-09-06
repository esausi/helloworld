#!groovy

node { 
  stage 'Checkout'
  //Organization Job, knows where to get the code
    checkout scm 
  
  stage 'Setup'
    sh 'npm config set registry http://registry.npmjs.prg/'
    sh 'npm install'

  stage 'Mocha test'
    sh './node_modules/mocha/bin/mocha'

  stage 'Cleanup'
    echo 'prune and cleanup'
    sh 'npm prune'
    sh 'rm node_modules -rf'
}