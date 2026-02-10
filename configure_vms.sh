#!/bin/bash

ZONE="asia-south1-a"

for VM in $(cat vm_list.txt)
do
  echo "Configuring $VM..."

  gcloud compute ssh $VM --zone=$ZONE --command="
    sudo apt update -y
    sudo apt install nginx -y
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo 'Deployed using shell script on GCP' | sudo tee /var/www/html/index.html
  "
done

echo "Configuration completed"




# after configuring the vms with nginx application run the below commands : 
# gcloud compute firewall-rules create allow-http \
  --allow tcp:80 \
  --target-tags=http-server
#now access the above deployed application using external IP 
#http://<VM_EXTERNAL_IP>
