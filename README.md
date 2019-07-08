# gsp303

Automating IIS Feature Installation with Powershell<br />
https://weblog.west-wind.com/posts/2017/may/25/automating-iis-feature-installation-with-powershell

Google Cloud - Compute Engine<br />
https://cloud.google.com/compute/docs/tutorials/basic-webserver-iis

Create a instance windows server<br />
gcloud compute instances create instance-win --image-family=windows-2016 --image-project=windows-cloud --zone=us-central1-a --scopes storage-ro --metadata windows-startup-script-url=gs://win-startup-scripts/setupserver.ps1

Check serial port outport of GCE<br />
gcloud compute instances get-serial-port-output my-instance --zone us-central1-a

Check GCS objects<br />
gsutil ls -r gs://win-startup-scripts/

Set a new user and get password from windows instances<br />
gcloud compute reset-windows-password vm-bastionhost --user app_admin --zone us-central1-a

