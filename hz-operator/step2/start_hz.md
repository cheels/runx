Start the Hazelcast Cluster by applying Hazelcast custom resource file `hazelcast.yaml`.

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

```plain
kubectl apply -f /root/hazelcast.yaml
kubectl -n default wait --for=condition=ready pod --all
```{{exec}}


Finally verify that Hazelcast cluster is up and running by clicking **CHECK** button.
