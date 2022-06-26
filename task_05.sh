AWS_ACCESS_KEY_ID=$(aws --region=us-east-1 ssm get-parameter --name "accesskey" --with-decryption --output text --query Parameter.Value)
AWS_SECRET_ACCESS_KEY=$(aws --region=us-east-1 ssm get-parameter --name "secretkey" --with-decryption --output text --query Parameter.Value)
AWS_DEFAULT_REGION=us-east-1

AMI=ami-052efd3df9dad4825
COUNT=1
INSTANCE_TYPE="t2.micro"
KEY_NAME="assignment-02-kp"
SUBNET_ID="subnet-0d6a22f68ea072d3d"
TAG='ResourceType=instance,Tags=[{Key=Name,Value=Ubuntu-Server-01}]'
SG="sg-08f341ba2644495c7"


SUBNET_ID_1="subnet-00230360b5e8d53af"
TAG_1='ResourceType=instance,Tags=[{Key=Name,Value=Ubuntu-Server-02}]'



if [[ "$UID" -ne "$ROOT_UID" ]]
   then
       echo "Must be root user to run this script"
       exit "$NOT_ROOT"
fi

source task_04.sh

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION

echo "Launching EC2...."

aws ec2 run-instances \
        --image-id $AMI \
        --count $COUNT \
        --instance-type $INSTANCE_TYPE \
        --key-name $KEY_NAME \
        --security-group-ids $SG \
        --subnet-id $SUBNET_ID \
        --tag-specifications $TAG \


aws ec2 run-instances \
        --image-id $AMI \
        --count $COUNT \
        --instance-type $INSTANCE_TYPE \
        --key-name $KEY_NAME \
        --security-group-ids $SG \
        --subnet-id $SUBNET_ID_1 \
        --tag-specifications $TAG_1 \
