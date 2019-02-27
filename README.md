# Chromebook Provisioning

## Installing

1. Install a Linux VM on your Chromebook
1. Bootstrap the VM by running the following command: 

```
curl -sf -L provision.nuss.io | sudo sh
```

### What does this do?

1. Installs and configures Ansible
1. Runs a `ansible-playbook` of the `provision.yml` in the ansible directory
