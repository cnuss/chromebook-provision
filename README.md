# Chromebook Provisioning

## Running

1. Install a Linux VM on your Chromebook
1. Bootstrap the VM by running the following command: 

```
curl -sf -L https://raw.githubusercontent.com/cnuss/chromebook-provision/master/provision.sh | sudo sh
```

## What does this do?

1. Installs and configures puppet
1. Runs a `puppet apply` of the Puppet code in (puppet)[puppet]
