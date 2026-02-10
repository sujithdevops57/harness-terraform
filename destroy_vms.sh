#!/bin/bash

ZONE="asia-south1-a"

if [ ! -f vm_list.txt ]; then
  echo "No VM list found!"
  exit 1
fi

for VM in $(cat vm_list.txt)
do
  echo "Deleting VM: $VM"
  gcloud compute instances delete $VM --zone=$ZONE --quiet
done

rm -f vm_list.txt

echo "All VMs destroyed successfully"
