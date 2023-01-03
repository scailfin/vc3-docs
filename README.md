# Installing REANA with the VC3 backend on a private headnode

The following documentation will show how to:
- Install REANA with the VC3 backend
- Submit a REANA workflow through condor
- Submit pilots to a remote target (e.g.: an HPC resource like NERSC)

## Pre-requisites
We will need a private machine or VM to install:
- HTCondor
- Docker
- Minikube
- REANA components

### Condor and docker
You can use your standard operating system package manager to install these packages. The recommended versions for HTCondor is 9.0+ and for Docker-ce: 19.03+.

### Minikube
This repository provides a shell script (install\_minikube.sh) to install a minikube version compatible with REANA. You will need sudo.

### REANA components
You can use the script install\_reana.sh for this.

## REANA demo submission workflow
TBA
