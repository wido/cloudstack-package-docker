#!/bin/bash
set -e

if [ ! -d "cloudstack" ]; then
    echo "Could not find directory 'cloudstack'"
    exit 1
fi

cd cloudstack

VERSION=$(grep '^  <version>' pom.xml| cut -d'>' -f2 |cut -d'<' -f1)
DISTCODE=$(lsb_release -sc)

dch -b -v ${VERSION}~${DISTCODE} -u low -m "Apache CloudStack Release $VERSION"

dpkg-buildpackage -j2 -b -uc -us
