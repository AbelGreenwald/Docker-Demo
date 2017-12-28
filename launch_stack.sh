
if [ $# != 1 ]; then
	echo "usage: $0 num"
	echo "num: Number of instances to launch"
	exit 1
fi

aws cloudformation create-stack \
    --stack-name Docker-Hello-World \
    --template-body file://cf_template.yaml \
    --parameters ParameterKey=NumInstances,ParameterValue=$1
