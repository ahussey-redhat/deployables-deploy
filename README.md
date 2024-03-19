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


### Run the playbook

> **Note**
>
> You will need to have valid SSH credentials to access the witness node.
> These credentials would have been created during the build of the ISO,
> which was used to deployed the witness node.
>
> You will also need the `vault` credential, which the secrets were
> encrypted with.

```bash
ansible-playbook deployables.ocp.configure_witness_node -vbKk --vault-id @prompt
```


### Use workloads

#### Access MSSQL deployment

```bash
sqlcmd -S mssql-deployment -C -U sa
# Enter password when prompted. You can find the password in project "test" -> "Secrets" -> "mssql"
```