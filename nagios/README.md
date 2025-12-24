# Docker-Nagios
Docker image for Nagios Core

A fun project I built out in 2018. Rebuilding it here as a time capsule of sorts. Updates may come, who knows. 

[Localhost Dashboard](http://localhost:8080/)

**The Challenge**
* Build out Nagios with Docker
* Confirm inventory is managed outside of docker image 
* Create automation to restart nagios when updates to inventory are pushed to main 
* Keep the image under 1GB in size!
* Current size **786MB**

### REQUIRED GITHUB PARAMETERS 
* **SSH_PRIVATE_KEY:** The private SSH key for the deployment user on the nagios server
* **ANSIBLE_USER:**	The ansible user or possible service_account to use when connecting to the server
* **TARGET_HOST_IP:**	The IP or hostname of the server where the Nagios application is deployed.
* **DOCKER_USERNAME:** Your dockerhub username 
* **DOCKER_TOKEN:** Dockerhub personal access token with read/write/detele permissions (not your dockerhub password)




### Configurations
Nagios Configuration lives in overlay/opt/nagios/etc
NagiosGraph configuration lives in overlay/opt/nagiosgraph/etc
  
#### Credentials

The default credentials for the web interface is `nagiosadmin` / `nagios`

### Extra Plugins

* Nagios nrpe [<http://exchange.nagios.org/directory/Addons/Monitoring-Agents/NRPE--2D-Nagios-Remote-Plugin-Executor/details>]
* Nagiosgraph [<http://exchange.nagios.org/directory/Addons/Graphing-and-Trending/nagiosgraph/details>]
* JR-Nagios-Plugins -  custom plugins I've created [<https://github.com/JasonRivers/nagios-plugins>]
* WL-Nagios-Plugins -  custom plugins from William Leibzon [<https://github.com/willixix/WL-NagiosPlugins>]
* JE-Nagios-Plugins -  custom plugins from Justin Ellison [<https://github.com/justintime/nagios-plugins>]
* DF-Nagios-Plugins - custom pluging for MSSQL monitoring from Dan Fruehauf [<https://github.com/danfruehauf/nagios-plugins>]
* check-mqtt - custom plugin for mqtt monitoring from Jan-Piet Mens [<https://github.com/jpmens/check-mqtt.git>]
