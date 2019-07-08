# Install the IIS services 
import-module servermanager 
 
add-windowsfeature web-server -includeallsubfeature 
 
# Overwrite the IIS web server default web page. 
echo '<!doctype html><html><body><h1>Hello World!</h1></body></html>' > C:\inetpub\wwwroot\index.html