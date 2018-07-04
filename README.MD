Docker Implementation of the ADL LRS
=================
Automated Docker installer for the ADL LRS.

The goal of this project is to streamline the installation of the public ADL LRS and further the accessibility of xAPI by reducing the workload required to stand up a private LRS.  

### Isn't there already a Docker instance of the ADL LRS? 
There were other implementations of this LRS using Docker, but those also *leverage heavily modified forks* of the ADL_LRS repository, making them difficult to update and already out of date with the latest xAPI Spec and Conformance requirements.  

This project uses a direct clone of official ADL repository with a single, minor modification to the `fabfile.py` for the sake of convenience when working with Docker.  *This modification is irrelevant to the xAPI Specification.*

## Things to Note
- **This project is in development and should be used with caution.**
- **This project is not directly associated with the ADL Initiative.**
- **This project DOES NOT include SMTP configuration!**
- **This project DOES NOT create a Django superuser by default.**

For the Django site admin, this will be created by bashing into the container and setting it up manually.

## What's in the box?
This project will create Docker containers for the following services:
- A Django web service (the ADL LRS) with uWSGI.
- An nginx proxy handling HTTP/HTTPS traffic on ports 80/443
- Postgres DB (LRS information and user accounts)
- RabbitMQ (enabling Celery and AMQP)

## How to Use
As this project is centered around Docker containers, there's very little setup required on the host machine. 

### TL;DR
1. `git clone https://github.com/vbhayden/adl-lrs-docker`
1. `cd adl-lrs-docker`
1. `sudo ./install-reqs.sh`
1. `sudo ./rebuild.sh`

### A bit more detail
Once you clone the repository, move to its root folder.  Here, you'll install all the necessary prerequisites and then run the actual build itself.  

Once the containers have finished building, the LRS service will need some time to start.  This is because of a strange visibility issue with Django's runtime and the Docker containers for RabbitMQ and Postgres, requiring that all containers be live before Django will believe they exist and interact.

To monitor the LRS setup process, you can use:
```
sudo docker logs -f docker_lrs
```
with `CTRL+C` cancelling the log once it reaches the `[uWSGI]` lines.  Once complete, the LRS should be visible at `https://localhost`.

