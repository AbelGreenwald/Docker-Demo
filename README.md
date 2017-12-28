---------
Overview:
---------

This script launches an AWS CloudFormation stack which contains a [Scenario 2 VPC](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html),
necessary networking resources, and an auto-scaling group. Upon creation, each ec2 instance launches the [Hello World](https://hub.docker.com/_/hello-world/) Docker container

---------------
Pre-Requisites:
---------------

- [AWS CLI](https://aws.amazon.com/cli/)
- AWS Access keys available for use by the AWS CLI.  This is usually done by executing: `aws configure` from the command line

--------------------
Hard Coded Defaults:
--------------------

**AWS Region:** us-east-1

**AMI:** Amazon Linux (ami-55ef662f)

**Instance Count:** Min 0, Max 5

**Instance Type:** t2.nano

**Stack Name:** Docker-Hello-World

**NetworkAclEntries:** Allow ALL traffic

**VPC CIDR Block:** 172.31.255.0/24


--------------------
Executing the Script
--------------------

The files launch_stack.sh and cf_template.yaml should be downloaded into the same directory.  Execute the bash script with `sh launch_stack.sh <num>` where num is the number of instances to launch the autoscaling group with.

------------------
Verifying Success:
------------------

Each instance will download Docker and execute `docker run hello-world` as part of the bootstrap process.  If this command is successful, the instance will send a success signal to CF.  If the command fails, the instance will be automatically terminated.

--------------------
Monitoring Progress:
--------------------

If you would like to monitor the stack's progress, execute: `aws cloudformation describe-stacks --stack-name Docker-Hello-World`

------------
Cleaning Up:
------------

Delete the stack with: `aws cloudformation delete-stack --stack-name Docker-Hello-World`