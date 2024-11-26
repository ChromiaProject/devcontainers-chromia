# Simple Chromia Development Environment

## Goals
This image aims to provider a VSCode friendly turnkey environment for Rell development.

## Installation
This is just a regular Dockerfile, but if you are looking to use this to develop a Rell project, you should simply ask Docker for the offical image at ``.

## Useage

We have based this image on one of the Microsoft provided defaults as our primary target is Visual Studio Code.

Unfortunately `apt-get` is broken, this will be resolved once we have revised the packing of our propriatory tools.

The container provides the following setup. 

### Java

The image comes with the Microsoft build of OpenJDK 21. It also has Maven.


### Postgres

The image auto-starts a Postgresql service at `localhost:5432` with the settings with a default database, username, and password, of `postchain`. These are also in environment variables for `psql` to use.

### Chromia Tooling

These are our specific tools: `chr` and `pmc`.

`chr` is the main tool for developing and testing Rell code.

`pmc` is for Postchain node management. This will not normally be needed for development, but a few functions, ex. key generation, are still relevant.

These will be the latest versions available at the time the image was built. They use the default Microsoft build of OpenJDK 21 that comes with the base image.
