
#cloud-config
cloud_final_modules:
  - [users-groups,always]
users:
  - name: ec2-user
    groups: [ wheel ]
    sudo: [ "ALL=(ALL) NOPASSWD:ALL" ]
    shell: /bin/bash
    ssh-authorized-keys: 
    - ${daniel-key}