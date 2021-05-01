# Azure Lab

Azure Lab for High Availability Web Hosting


## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[ELK Topology Draw.pdf](https://github.com/SilviavonBuelow/AzureLab/files/6409726/ELK.Topology.Draw.pdf)

<figure><img src=“/Images/ELK_Topology.png”><figcaption></figcaption></figure>


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the "YALM" files may be used to install only certain pieces of it, such as Filebeat.

  Name 
- Project Related Ansible Files

- Screenshoots of Azure Configuration
- Linux Administration BASH scripts

This document contains the following details:
- Description of the Topology
- Access Policies
  IP Adrreses (Internal and External)
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly availability, in addition to restricting traffic to the network.

- A Load Balancer can ensure systems such as 'Web Servers' have trafic equally distributed to the most available server ensuring that whatever is being hosted has the highest probability if being available.

- The 'Jump-Box' Server helps restrict backend accross to the network to a single point of entry on a separate external IP address. The 'Jump-Box' server uses an 'Ansible' container to run the 'playbook.yml' files to configure new and existing servers on the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.

-The Filebeat process watches System Logs for changes to the system files.

- The Metricbeat process Logs machine metrics including uptime, CPU, Memory and Traffic Loads.

The configuration details of each machine may be found below.


| Name          | Function       | IP Address               |   OS  |
|----------     |----------      |--------------------------|-------|
| Jump Box      | Gateway        |  10.0.0.4/52.170.101.5   | Linux |
| ELK-SERVER    | Elk-server     |  10.1.0.4/20.36.0.231    | Linux |
| DVWA-VM-1     | Web server     |  10.0.0.5/52.234.168.14  | Linux |
| DVWA-VM-2     | Web server     |  10.0.0.6/52.234.168.14  | Linux |
| DVWA-VM-3     | Web server     |  10.0.0.7/52.234.168.14  | Linux |
| Load Balancer | load balancer  |  52.234.168.14           | Linux |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box Provisioner machine can accept connections from the public address on the Internet. Access to this machine is only allowed from the following IP addresses: 
52.136.124.58

Machines within the network can only be accessed by Jump-Box Server via the Ansible container running on the Jump Box.

A summary of the access policies in place can be found in the table below.

| Name                  | Publicly Accessible | Allowed IP Addresses     |
|-----------------------|---------------------|----------------------    |
| JUMP-BOX: Port 22     |     Yes             |  52.170.101.5            |
| ELK-SERVER: Port 5601 |     Yes             |  20.36.0.231             |
| ELK-SERVER: Port 22   |     No              |  10.1.0.4 (Jump-Box)     |
| Load Balancer: Port 80|     Yes             |  52.234.168.14           | 
| DVWA-VM-1             |     No              |  10.1.0.4 (Jump-Box)     | 
| DVWA-VM-2             |     No              |  10.1.0.4 (Jump-Box)     | 
| DVWA-VM-3             |     No              |  10.1.0.4 (Jump-Box)     | 


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because using Ansible, you can very quickly rebuild the entire infrastructure. This means better quality assurance in that all servers will be setup the same way. It will also save time because changes can happen all at the same time.

The playbook implements the following tasks:

... Download 'Images' to be installed on target machines.
... Install software such as Docker & Python 3 (PIP)
... Increases 'Virtual Memory' on target systems as needed.
... Publishes Required Ports such as: (tcp) 5044, 5601, 9200, 9300
... Download and install ELK Stack Container (v761)
... Enable installed system to startup on reboot

### Target Machines & Beats

This ELK server is configured to monitor the following machines:

| Name        | Function   | IP Addresses |     Operating Systems     |
|-------------|------------|--------------|---------------------------|
| DVWA-VM-1   | Web-Server |  10.0.0.5    | Linux - Ubuntu 18.04 LTS  |
| DVWA-VM-2   | Web-Server |  10.0.0.6    | Linux - Ubuntu 18.04 LTS  |
| DVWA-VM-3   | Web-Server |  10.0.0.7    | Linux - Ubuntu 18.04 LTS  |

We have installed the following Beats on these machines:

- FileBeats
- MetricBeats

These Beats allow us to collect the following information from each machine:

- File beats collects logs of file changes for each monitored system. The information is than sent to Logstash and Elastic Search. An Example would be system.syslog that shows the boot process and
- Collects metrics on the system such as CPU, Memory and Traffic Load and is used to generate reports. Its used to report on CPU, Memory and load metrics

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

- Copy the 'filebeat_config.yml' and 'filebeat-playbook.yml' files to /etc/Ansible/files directory.
- Make sure to update the 'host' IP address in lines 1106 and 1806 in the filebeats_config.yml file.
- Run the playbook, and navigate to the Kibana Server URL (kibana.4-indigo.com) to check that the installation worked as expected.

Run these commands to first change to the directory where the elk-server.yml file will be saved. You will run the curl command to download the elk-server

cd /etc/ansible
curl -i href="https://github.com/SilviavonBuelow/AzureLab.git
ansible-playbook /etc/ansible/elk-server.yml

