# ElasticStackSetup

> [!Note]
> As of 11/16/23, this will build an Elastic Stack with security features enabled

![elkbanner](https://github.com/nathancroce/ElasticStackSetup/assets/90940521/832c0fbb-ca52-4099-9ad9-4b600c1af64d)

These scripts should be useful in setting up and configuring a locally-run Elastic Stack on a Linux machine. 
<br><br>
All contributions are appreciated!
<br>

## How to install & run

### 1. Download this Repository
```
sudo apt-get install git
sudo git clone https://github.com/nathancroce/ElasticStackSetup
```

### 2. Run [setup_install](https://github.com/nathancroce/ElasticStackSetup/blob/main/setup_install)
This is the first script to run, and it **MUST** be run from the `ElasticStackSetup` directory. It will install elasticsearch, kibana, logstash, and filbeats as apt packages. This will only install and configure the essentials: security will be disabled
```
cd ElasticStackSetup
sudo bash setup_install
```
Runtime for this script is about 400 seconds on my VM. If you receive errors and the runtime is much less than that, running the script again always works for me (idk why, but sometimes it just doesn't run correctly).

### 3. Run [setup_passwords](https://github.com/nathancroce/ElasticStackSetup/blob/main/setup_passwords)
This is the second script to run. It will create default random passwords for `elastic`, `kibana_system`, `logstash_system`, `beats_system`, `apm_system`, and `remote_monitoring_user`. Make sure to save the passwords when they are outputted to the terminal at the end of the script.
```
sudo bash setup_passwords
```

### 4. Run [setup_tls](https://github.com/nathancroce/ElasticStackSetup/blob/main/setup_tls)
This is the third script to run. It will create a certificate authority(the CA is self signed) and a certificate for encryption. The passwords for the CA and certificate will be randomly generated as well. Make sure to save the passwords when they are outputted to the terminal at the end of the script.
```
sudo bash setup_tls
```

### x. Run [status_services](https://github.com/nathancroce/ElasticStackSetup/blob/main/status_services)
This script displays the current status of elasticsearch, kibana, logstash, and filebeats. It is only used for convenience.
```
sudo bash status_services
```
