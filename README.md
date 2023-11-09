# ElasticStackSetup


> [!Note]
> As of 11/9/23, this will build an Elastic Stack with security features disabled. Security will be configured next week

![elkbanner](https://github.com/nathancroce/ElasticStackSetup/assets/90940521/832c0fbb-ca52-4099-9ad9-4b600c1af64d)


These scripts should be useful in setting up and configuring a locally-run Elastic Stack on a Linux machine

For an automated setup with apt packages, make sure your working directory is `ElasticStackSetup/`, and run `setup_apt` as root

### How to install & run on your Ubuntu VM

```
sudo apt-get install git
sudo git clone https://github.com/nathancroce/ElasticStackSetup
cd ElasticStackSetup
sudo bash setup_apt
```

<br><br>
All contributions are appreciated!
