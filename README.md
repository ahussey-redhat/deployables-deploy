# deployables-deploy
Repository to host artefacts related to deploying and configuring deployables

## Setup
Ensure you have the following Ansible collections downloaded and placed in `./dependencies/ansible`:
  - redhat.rhel_system_roles
  - redhat.satellite
  - redhat.satellite_operations

Install the collections:
```bash
# You may need to manually add the above Red Hat collections to the requirements.yml file
cd ./dependencies/ansible
ansible-galaxy install -r requirements.yml
cd -
```

## Configure the `witness` node

### Prerequisites

1. Ensure that you have the `oc-mirror` archive available

### rsync commands for dependency USB creation
```bash
rsync -av --exclude rhel-9.3-x86_64-dvd.iso deployables-deploy/dependencies/ /run/media/user/dependencies/
rsync -av --exclude dependencies --exclude dev-requirements.yml --exclude deployables.code-workspace --exclude download_and_install_deps.sh deployables-deploy /run/media/user/dependencies/
```

### Install and Configure the Witness Node

1. Insert the USB hub containing the two prepared USBs
  1. USB 1 has been prepared with Ventoy and contains:
    1. The RHEL9 ISO
    1. The kickstart file
    1. The Ventoy configuration file
  1. USB 2 has been prepared with all the dependencies
1. Power on the witness node
  The witness node will perform and automated installation and then shutdown. The installation may take up to 40 minutes, depending how many artefacts the `dependencies` directory contains
1. When the witness node shuts down, remove the USB hub and power the witness node back on
  The witness node will then run the appropriate automation to fully configure it and prepare to deploy OpenShift. This may take 1-2 hours to complete, depending on the size of the `oc-mirror` tarball


### Use workloads

#### Access MSSQL deployment

```bash
sqlcmd -S mssql-deployment -C -U sa
# Enter password when prompted. You can find the password in project "test" -> "Secrets" -> "mssql"
```
