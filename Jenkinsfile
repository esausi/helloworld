//The declarative pipeline is defined within a block labeled ‘pipeline’
//whereas the scripted pipeline is defined within a ‘node’.
//Credentials type: usernamePassword, download info onto USERNAME and PASSWORD variables, its possible to use echo USERNAME or sh 'echo $USERNAME'
//Using withCredentials, apply just for sh commands, git command use ID passed as parameters
//This pipeline is pointing to an organization, not user, by this, its not possible to use normal git command,
//which force to change to github.com/USERNAME/PROJECTNAME
pipeline {
  agent any

  tools {nodejs "NodeJS"}

  stages {

    stage('Dependencies'){
      steps {
        sh 'npm install'
      }
    }

    stage('Mocha Test'){
      steps {
// exit-mocha.js created to force exit mocha when finish testing
        sh 'node --expose-internals ./node_modules/.bin/mocha exit-mocha.js test/**/*.js'
      }
    }

    stage('Cleanup'){
      steps {
        echo 'prune and cleanup'
        sh 'npm prune'
        sh 'rm node_modules -rf'
      }
    }
  }
}
