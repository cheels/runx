Now, lets connect Hazelcast Clients to the Cluster. To do this we need to extract the Discovery address and port from the HazelcastEndpoint object:

1. Use the following command, which filters the output and save it into property:
    ```
    CLUSTER_ADDRESS=$(kubectl get hazelcastendpoint -o jsonpath='{range .items[?(@.spec.type=="Discovery")]}{.status.address}{"\n"}{end}')
    ```{{exec}}
   
2. Run the following command for adding the cluster config to the CLC.
    ```
    clc config add hz cluster.name=dev cluster.address=$CLUSTER_ADDRESS
    ```{{exec}}
   
3. Run the following command to fill a map using CLC
    ```
    for i in {1..10};
    do
    clc -c hz map set --name map1 key-$i value-$i;
    done
    ```{{exec}}
   
4. Run the following command for adding the cluster config to the CLC.
    ```
    clc -c hz map size --name map1 -f json
    ```{{exec}}
   
Finally, verify that Hazelcast cluster is up and running by clicking **CHECK** button.
