Hazelcast Enterprise requires a license key. If you don’t have a license key, you can request one from the [Hazelcast website](http://trialrequest.hazelcast.com/)
<br>
So, please, paste your license key in the **Tab1**:

1. Create a Kubernetes secret to hold your license key.

```plain
kubectl create secret generic hazelcast-license-key --from-literal=license-key="$LICENSE_KEY"
```{{exec}}

2. Start the Hazelcast Cluster by applying Hazelcast custom resource file `hazelcast.yaml`.

```plain
kubectl apply -f /root/hazelcast.yaml --wait
kubectl wait --for=jsonpath='{.status.phase}'=Running --timeout=120s hazelcast/hazelcast || kubectl get hazelcasts.hazelcast.com hazelcast -o wide
```{{exec}}

Finally, verify that Hazelcast cluster is up and running by clicking **CHECK** button.
