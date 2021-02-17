# helloworld

Project used to construct WebServer on AWS,
- EC2 instance as Deploy unit
- Create IAM service role & policy
- CodeDeploy as Deployment Tool
- CodePipeline as pipeline

## Troubleshotting

**CodeDeploy/CodePipeline start on change, but it's not possible to deploy to EC2 instance**
Its possible CodeDeploy Agent is not installed on EC2 instance

**Action 1**: Manually deployed CodeDeploy Agent to EC2 Instance and try
**Result**: Now it is connecting to EC2 instance and trying to execute scripts, failing on scripts/validate.sh, 3000 port is not active

**Action 2**: Checking file scripts/validate.sh, there is a path problem, corrected
**Result**: Deployment working once change uploaded to github code repository

**Action 3**: Generate again an EC2 instance using CloudFormation/ansible, but this time without installing CodeDeploy manually.
**Result**:

```
% aws cloudformation delete-stack \
      --stack-name nodeserver

% aws cloudformation wait stack-delete-complete \
      --stack-name nodeserver       

% aws cloudformation create-stack \
      --capabilities CAPABILITY_IAM \
      --stack-name nodeserver \
      --template-body file://nodeserver-cf.template \
      --parameters ParameterKey=KeyPair,ParameterValue=EffectiveDevOpsAWS

% aws cloudformation wait stack-create-complete \
      --stack-name nodeserver      
```

EC2 instance created, git and ansible packages installed by CloudFormation working ok.
When ansible tries to install CodeDeploy Agent, script returns different value than required

**Action 4**: Change way of install CodeDeploy Agent, downloading code and running command locally taking as reference: https://github.com/aptoma/ansible-aws-codedeploy.git
**Result**: Running locally in EC2 instance ansible-pull command is successfull. Time to execute complete example starting from CloudFormation script.

**Action 5**: Running CloudFormation script to create EC2 instance with CodeDeploy Agent
**Result**: EC2 created and Agent running, but no ansible-pull cron crated. Needs to be added crontab rol to ansible playbook

**Action 6**: crontab role added to playbook and echo instruction for create /etc/cron.d/ansible-pull file eliminated
**Result**: Error, crontab cron not added. Checking differences between working command executed vs command created on /etc/cron.d/ansible-pull file it seams that path to ansible-pull command is incomplete

**Action 7**: Jinja templates for create crontab command corrected with absolut path to ansible-pull command
**Result**: Everything working ok.
- Testing changes on Application repo working ok, curl http://nodeserver.caramba.ga:3000/
- Testing changes on Playbook repo working ok, ssh -i ... ec2-user@nodeserver.caramba.ga


## Tips for help

- Installing CodeDeploy agent by commandline
https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-linux.html

- CodeDeploy Agent status

```
% sudo service codedeploy-agent status
```

- ssh connection to nodeserver EC2 instance

```
% ssh -i ~/.ssh/EffectiveDevOpsAWS.pem ec2-user@nodeserver.caramba.ga
```
