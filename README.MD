ADL LRS Installer
=================
Automated installer for the ADL LRS.

The goal of this project is to streamline the installation of the public ADL LRS and further the accessibility of xAPI by reducing the workload required to stand up a private LRS.  The RabbitMQ / Postgres services are stood up as Docker containers, so some knowledge of Docker will be beneficial for more granular configuration. 

**Please Note:**
- **This project is in development and should be used with caution.**
- **This project is not directly associated with the ADL Initiative.**
- **This project DOES NOT include SMTP configuration!**

## How to Use
To set up a private instance of the ADL LRS, we will be cloning this repository onto your Ubuntu instance (16 tested, may require modifications for other versions).

The original LRS installation instructions are available in detail at the [ADL LRS Github](https://github.com/adlnet/ADL_LRS).  

### TL;DR
1. `sudo mkdir /var/lrs`
1. `sudo chmod -R 777 /var/lrs`
1. `git clone https://github.com/vbhayden/adl-lrs-installer /var/lrs`
1. `cd /var/lrs`
1. `sudo chmod +x ./setup.sh`
1. `./setup.sh --admin`
1. `sudo ./deploy.sh`

### Details
The steps above should have created a running, self-signed HTTPS-enabled ADL LRS instance.  What is actually running?
- A Django web service (the ADL LRS) with uWSGI.
- An nginx proxy handling HTTP/HTTPS traffic on ports 80/443
- Two docker containers
  - Postgres DB (LRS information and user accounts)
  - RabbitMQ (enabling Celery and AMQP)

This installer is intended to be run **once**, but that is primarily due to the `./setup.sh --admin` step.  That step creates the Django superuser using a modified `fabfile.py`.  You can skip this user creation by omitting the `--admin` argument.
