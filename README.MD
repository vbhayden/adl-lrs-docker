Docker Implementation of the ADL LRS
=================
Automated Docker installer for the ADL LRS.

The goal of this project is to streamline the installation of the public ADL LRS and further the accessibility of xAPI by reducing the workload required to stand up a private LRS.  There were other implementations of this LRS using Docker, but those also leveraged modified forks of the ADL_LRS repository.  This project uses the ADL_LRS with a single, minor modification to the `fabfile.py`.

**Please Note:**
- **This project is in development and should be used with caution.**
- **This project is not directly associated with the ADL Initiative.**
- **This project DOES NOT include SMTP configuration!**
- **This project DOES NOT create a Django superuser by default.**

## How to Use
To set up a private instance of the ADL LRS, we will be cloning this repository onto your Ubuntu instance (16 tested, may require modifications for other versions).

The original LRS installation instructions are available in detail at the [ADL LRS Github](https://github.com/adlnet/ADL_LRS).  

### TL;DR
1. `git clone https://github.com/vbhayden/adl-lrs-docker`
1. `cd adl-lrs-docker`
1. `sudo ./install-reqs.sh`
1. `sudo ./rebuild.sh`

Once the containers have finished building, the LRS service will need some time to start.  This is because of a strange visibility issue with Django's runtime and the Docker containers for RabbitMQ and Postgres, requiring that all containers be live before Django will believe they exist and interact.

To monitor the LRS setup process, you can use:
```
sudo docker logs -f docker_lrs
```
with `CTRL+C` cancelling the log once it reaches the `[uWSGI]` lines.  Once complete, the LRS should be visible at `https://localhost`.


### Details
The steps above should have created a running, self-signed HTTPS-enabled ADL LRS instance.  What is actually running?
- A Django web service (the ADL LRS) with uWSGI.
- An nginx proxy handling HTTP/HTTPS traffic on ports 80/443
- Postgres DB (LRS information and user accounts)
- RabbitMQ (enabling Celery and AMQP)

As this is configured using Docker, your actual system will remain untouched (aside from the requirements to run Docker and clone the repository).
