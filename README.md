# home_task
2. a) 
* Check that the TEST EC2 instance is properly routed through the DEV TGW, ensuring it can communicate with the Egress VPC and Inspection VPC.
* Verify if the route table in the TEST Spoke VPC allows for traffic destined to the Egress VPC and Inspection VPC via the Transit Gateway.
* Confirm that the TEST EC2 instance's security group allows outbound traffic to port 53 and port 443 for HTTPS requests to DNS servers and other external services.
* Inspect the security group rules on the Checkpoint FW EC2 to ensure inbound DNS requests from the TEST EC2 instance are permitted.
* Ensure the NAT Gateway in the Egress VPC is functioning and correctly configured for outbound traffic.
* Check the firewall rules and logs to ensure DNS requests are not blocked and that it properly forwards traffic.
* Verify that Route 53 or any external DNS service is correctly configured and reachable from TEST EC2.

b)
* Check if the NAT Gateway in the Egress VPC is properly configured and has internet access via an Internet Gateway. Ensure it's correctly associated with the TEST Spoke VPC for outbound traffic.
* Ensure the route table in the TEST Spoke VPC is configured to send internet-bound traffic to the NAT Gateway via the Transit Gateway.
* Verify that the security groups and network ACLs for TEST EC2 and the NAT Gateway allow outbound traffic on necessary ports.
* Confirm that the Checkpoint Firewall EC2 is not blocking outbound traffic, and that any firewall rules allow internet-bound traffic.

c. 1)
* Ensure that the TEST EC2 Docker client is correctly authenticated with the Nexus repository. Check if credentials are properly configured.
* Verify the Nexus repository permissions to ensure the user or service account pulling the images has the required access.
* Confirm the Nexus repository URL and port are correct.
* Check Nexus permissions and Docker registry configuration.
* Ensure no firewalls or proxies block traffic between TEST EC2 and Nexus EC2.

c. 2) 
* Ensure TEST EC2 can reach the Nexus EC2 over the network. Check VPC peering, routes, and security groups.
* Verify the Nexus repository is responsive and not experiencing performance issues or high load.
* Check if there are network latency or bandwidth issues between the TEST EC2 and Nexus EC2 that could cause the timeout.
* Ensure DNS is resolving the Nexus repository's address correctly and that no delays occur in communication.
* Verify that no firewall or proxy is restricting or slowing down the traffic between the TEST EC2 and Nexus EC2.

c. 3)
* Run this commands to start the docker service:
```
sudo systemctl start docker
or
sudo service docker start
```
* Check the docker status: 
```
 sudo systemctl status docker
```
* Review Docker logs using:
```
sudo journalctl -u docker
```
to check for errors causing the daemon to stop.
* Ensure sufficient disk space is available, as lack of space can prevent Docker from running.

3.) 
* Verify that the TEST EC2 instance's security group allows inbound traffic on port 443.
* Ensure no network ACLs or firewalls are blocking port 443.
* Confirm that the TEST EC2 instance is in a subnet that has an Internet Gateway attached or uses a NAT Gateway for internet access. and ensure outbound HTTPS traffic is allowed through the NAT or Internet Gateway.
* Check if the service running on TEST EC2 is properly configured to listen on port 443. and ensure the service has a valid SSL certificate for HTTPS.
* Verify that the DNS record is correctly pointing to the public IP address of the TEST EC2 instance. and confirm that DNS propagation has completed and is resolving correctly from external networks.
* Ensure the SSL certificate on the TEST EC2 machine is valid and correctly installed.
* Check the service logs on the TEST EC2 instance for any errors related to HTTPS or SSL connections.

4.) Install telnet:
```
sudo yum install telnet -y
```
* If the installation fails, it's likely that the required repository is either disabled or missing.
* Ensure the extras repository is enabled:
```
sudo amazon-linux-extras enable epel
```
* After enabling the repository, update your packages and install Telnet:
```
sudo yum update -y
sudo yum install telnet -y
```
