# gsp303

**How to:**<br />

Step 1. In GCP console, on the top right toolbar, click the Open Cloud Shell button.<br />

Step 2. Clone the gsp303 repository from gitgub:<br />
> git clone https://github.com/neolin-cloudmile/gsp303.git
> cd gsp303

Step 3. Setup the environment and install Terraform<br />
> ./setup_terraform_and_cloud_shell.sh

Step 4. Go to the folder tfnet<br />
> cd tfnet

Step.5 Run Terraform<br />
> terraform init
> terraform fmt
> terraform plan
> terraform apply

Step 6. Verify resource created bu Terraform<br />

Reference:<br />

Automating IIS Feature Installation with Powershell<br />
https://weblog.west-wind.com/posts/2017/may/25/automating-iis-feature-installation-with-powershell

Google Cloud - Compute Engine<br />
https://cloud.google.com/compute/docs/tutorials/basic-webserver-iis

Create a instance windows server:<br />
> gcloud compute instances create instance-win --image-family=windows-2016 --image-project=windows-cloud --zone=us-central1-a --scopes storage-ro --metadata windows-startup-script-url=gs://win-startup-scripts/setupserver.ps1

Check serial port outport of GCE:<br />
> gcloud compute instances get-serial-port-output my-instance --zone us-central1-a

Check GCS objects:<br />
> gsutil ls -r gs://win-startup-scripts/

Set a new user and get password from windows instances:<br />
> gcloud compute reset-windows-password vm-bastionhost --user app_admin --zone us-central1-a

Grant anyone on the internet READ access to the object example-object:<br />
> gsutil acl ch -u AllUsers:R gs://win-startup-scripts/startup.ps1

gsutil commands - acl<br />
https://cloud.google.com/storage/docs/gsutil/commands/acl#ch-examples
