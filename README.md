# Scotty + Docker

A dockerized Haskell web service.

## Mac Setup Steps

* Install [VirtualBox](https://www.virtualbox.org/)
* Install [docker-machine](https://docs.docker.com/machine/)
* Run: `docker-machine create --driver virtualbox dev`
* Run: `docker-machine ls` and ensure that your `dev` VM is running. If it is not, run: `docker-machine start dev`. Make note of the `dev` VM's IP address for later use.
* Clone this repo somewhere
* Change CWD to new directory containing repo codes
* Run: `$(docker-machine env)`
* Run: `docker build -t scotty-docker .`
* Run: `docker run -i -t -p 3001:3000 scotty-docker`
* Open browser and make a request to: `http://IP_NOTED_IN_EARLIER_STEP:3001/flarp`
