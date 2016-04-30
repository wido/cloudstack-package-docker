# CloudStack Package Docker
Docker images for building Apache CloudStack DEB packages.

Used by the Jenkins slaves of the project to build packages for releases.

# Building packages
Building DEB packages with the Docker container is rather easy, a few steps are required:

## Clone Apache CloudStack source code
The first step required is to clone the CloudStack source code, in /tmp for example:

    cd /tmp
    git clone https://git-wip-us.apache.org/repos/asf/cloudstack.git cloudstack

Now that you have done so we can continue

## Pull Docker Images
Let's assume we want to build packages for Ubuntu 16.04 LTS (Xenial). We pull that image first

    docker pull cloudstack/package-docker-deb:ubuntu1604

You can replace *ubuntu1604* by *ubuntu1404* if you want.

## Build Packages
Now that we have the Docker images we can build packages by mapping /tmp into /mnt/build in the container.

    docker run -v /tmp:/mnt/build cloudstack/package-docker-deb:ubuntu1604

After the build has finished the *.deb* packages are available in */tmp* on the host system.
