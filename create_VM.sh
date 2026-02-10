#!/bin/bash

VM_PREFIX="dev-vm"
COUNT=3
ZONE="asia-south1-a"
MACHINE_TYPE="e2-medium"
IMAGE_FAMILY="debian-11"
IMAGE_PROJECT="debian-cloud"

echo "Creating $COUNT VMs in GCP..."

> vm_list.txt

for i in $(seq 1 $COUNT)
do
  VM_NAME="${VM_PREFIX}-${i}"

  gcloud compute instances create $VM_NAME \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --image-family=$IMAGE_FAMILY \
    --image-project=$IMAGE_PROJECT \
    --tags=http-server

  echo $VM_NAME >> vm_list.txt
done

echo "VM creation completed" 

#                           
