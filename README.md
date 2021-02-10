# helloworld

Project used to construct WebServer on AWS,
- EC2 instance as Deploy unit
- CodeDeploy as Deployment Tool
- CodePipeline as pipeline

## Troubleshotting

**CodeDeploy/CodePipeline start on change, but it's not possible to deploy to EC2 instance**
Its possible CodeDeploy Agent is not installed on EC2 instance

**Action 1**: Manually deployed CodeDeploy Agent to EC2 Instance and try
**Result**: Now it is connecting to EC2 instance and trying to execute scripts, failing on scripts/validate.sh, 3000 port is not active
