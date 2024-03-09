# Using Vault OSS with HA installation

### Goal

- [x] setup HashiCorp Vault in the high available variant.
  - [x] use raft as backend
  - [x] use 2 azure VMs: `vault1` and `vault2`
  - [x] use ansible for installation and configuration
  - [x] expose both Vault instances:
    - [x] add secret to 1 `vault1` - will it sync to the second one -> yes

## Documentation

- <https://developer.hashicorp.com/vault/docs/configuration/storage/raft>
- <https://blog.yasithab.com/centos/hashicorp-vault-ha-cluster-with-raft-and-aws-kms-on-centos-7/>
- <https://www.velotio.com/engineering-blog/how-to-setup-hashicorp-vault-ha-cluster-with-integrated-storage-raft>

## Playbook

```
ansible-galaxy install -r roles/requirements.yml --force
ansible-playbook -i inventory/azure.ini main.yml
```

