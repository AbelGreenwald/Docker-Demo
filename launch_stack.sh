#!/bin/bash
#
# Creates a CloudFormation stack with CLI command
# Mandatory arguments:
# 1 - Number of instances to launch
#

# Check if user entered valid number of params
if [ $# != 1 ]; then
	echo "usage: $0 num"
	echo "num: Number of instances to launch"
	exit 1
fi

# Create the stack
aws cloudformation create-stack \
    --stack-name Docker-Hello-World \
    --template-body file://cf_template.json \
    --parameters ParameterKey=NumInstances,ParameterValue=$1
