Start the Hazelcast Cluster by applying Hazelcast custom resource file `hazelcast.yaml`.

<details>
<summary>hazelcast.yaml</summary>

```yaml

apiVersion: hazelcast.com/v1alpha1
kind: Hazelcast
metadata:
  name: hazelcast
spec:
  clusterSize: 3
  repository: 'docker.io/hazelcast/hazelcast'
  version: '5.5-slim'
```
</details>

```plain
kubectl apply -f /root/hazelcast.yaml --wait
kubectl wait --for=jsonpath='{.status.phase}'=Running --timeout=60s hazelcast/hazelcast || kubectl get hazelcasts.hazelcast.com hazelcast -o wide
```{{exec}}


Finally verify that Hazelcast cluster is up and running by clicking **CHECK** button.
