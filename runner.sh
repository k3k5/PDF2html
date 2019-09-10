#!/bin/sh

echo "** Checking for Dependencies: Docker **"

which docker

if [ $? -eq 0 ]
then
    docker --version | grep "Docker version"
    if [ $? -eq 0 ]
    then
        echo "Docker installed..."
    else
        echo "*** Please install Docker!"
        echo "*** Aborting!"
        exit
    fi
else
    echo "*** Please install Docker!"
    echo "*** Aborting!"
    exit
fi

echo "** Checking for Dependencies: NodeJS **"

which node

if [ $? -eq 0 ]
then
    node --version | grep "v"
    if [ $? -eq 0 ]
    then
        echo "Node installed..."
    else
        echo "*** Please install NodeJS!"
        echo "*** Aborting!"
        exit
    fi
else
    echo "*** Please install NodeJS!"
    echo "*** Aborting!"
    exit
fi

echo "** Converting file: " + $1
docker run -ti --rm -v `pwd`:/pdf bwits/pdf2htmlex pdf2htmlEX $1

echo "** Done converting"
echo "** Changing styles to inline styles"
node index.js ${1//'pdf'/'html'} > $2
echo "** I'm done now!"
open .
