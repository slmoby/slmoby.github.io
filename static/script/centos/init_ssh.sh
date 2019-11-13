#!/bin/bash


ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 .ssh/authorized_keys
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

echo "authorized ssh keys done"
