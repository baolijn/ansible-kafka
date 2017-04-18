# ansible to deploy Kafka cluster and Kafka manager

## requirements

- Ansible 1.9 +
- Centos 6

## configure


create the `environments` config folder.

```
cp -r environments/dev environments/test 
```

edit `environments/test/inventory` config server role.
```
[kafka]
kafkanode01 ansible_host=192.168.33.201
kafkanode02 ansible_host=192.168.33.202
kafkanode03 ansible_host=192.168.33.203

[kafka-manager]
kafkanode01 ansible_host=192.168.33.201
```
edit `environments/prod/group_vars/all` config the setup parameters.
```
---
# common
ntpserver: 192.168.33.201
interface: 'eth1'
```

## startup deploy
```
export ENVIRONMENTS=test
./deploy.sh KAFKA
```

## Manage Kafka cluster

- access `http://<kafka-manager ip >:9000`
- user/password : `admin/password`