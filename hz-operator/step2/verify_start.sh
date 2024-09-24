#!/bin/bash

READY_MEMBERS=$(kubectl get hazelcast hazelcast -o=json | jq -r '.status.hazelcastClusterStatus.readyMembers')
if [[ $READY_MEMBERS -ne "3/3" ]]; then
    exit 1
fi


