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
You can use the script install\_reana.sh for this. REANA will use the following docker images:

https://hub.docker.com/layers/khurtado/reana-server/vc3v2p2/images/sha256-77f64603847b3236977722696ac815a482fe08ea298c91247f0da24c9be35ed1?context=repo
https://hub.docker.com/layers/khurtado/reana-job-controller/vc3v2p2/images/sha256-17a0f30d13b8bdcf68a14d3eaf247bc756f910456a28e24a77172baa9291a9a8?context=repo
https://hub.docker.com/layers/khurtado/reana-workflow-controller/vc3v2p2/images/sha256-d17c76ab5c70d48553438a9ded514a47da05d1aa568b396682860337d3e0c118?context=repo
https://hub.docker.com/layers/khurtado/reana-workflow-engine-serial/vc3v2p2/images/sha256-08be28cc66125e59adf3d83697381a0b1772f511773158afa67f1bd8a388dca6?context=repo
https://hub.docker.com/layers/khurtado/reana-workflow-engine-cwl/vc3v2p2/images/sha256-665163369ba5c521f2023079bc11c416f112b04996d1ccd46ba996ce4f7c53fe?context=repo
https://hub.docker.com/layers/khurtado/reana-workflow-engine-yadage/vc3v2p2/images/sha256-892ac75b922db8bddf1fbbdf3dd9ed47735ed9fd7c5c84a385cdb866352fbe3d?context=repo

## REANA demo submission workflow
TBA
