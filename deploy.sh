#!/bin/sh

export CAPTURE_INTERVAL=1000
#export KAFKA_BROKER_URL=kafka-rock-cccltno--oc---visbma.bf2.kafka.rhcloud.com:443
#export SASL_USERNAME=
#export SASL_PASSWORD=

echo $KAFKA_BROKER_URL
echo $SASL_USERNAME
echo $SASL_PASSWORD
echo $CAPTURE_INTERVAL

oc apply -f ./deploy/consumer-deployment.yaml


oc apply -f ./deploy/Seldon-Deployment.yaml

oc apply -f ./deploy/minio-full.yaml

oc new-app https://github.com/bfarr-rh/predictive-maint.git  --context-dir=frontend  --name=dashboard -e MINIO_URL=http://minio-ml-workshop:9000
oc create route edge --service=dashboard

oc new-app https://github.com/bfarr-rh/anamoly-detection.git  --context-dir=event-producer-js --name=frontend -e CAPTURE_INTERVAL=$CAPTURE_INTERVAL -e KAFKA_BROKER_URL=$KAFKA_BROKER_URL -e SASL_USERNAME=$SASL_USERNAME -e SASL_PASSWORD=$SASL_PASSWORD

oc create route edge --service=frontend

