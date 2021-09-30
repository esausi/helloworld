# helloworld
Web app for test automation

## Tech stack
This app was created using,
- NodeJS

Deployment of the app,
- CodeDeploy + CodePipeline: appspec.yml, scripts/*

## Test app deployment
Commit and push changes to the github repo, CodePipeline + Jenkins had a hook for observe the changes on the repo and start the deployment, once finished, enter to

```js
curl http://nodeserver.esausi.com:3000/
```
