Start the Hazelcast Cluster by applying Hazelcast custom resource file `hazelcast.yaml`.
Hazelcast Enterprise requires a license key. If you don’t have a license key, you can request one from the [Hazelcast website](http://trialrequest.hazelcast.com/)
So, please, enter your license key in the CLI:

```plain
kubectl apply -f /root/hazelcast.yaml --wait
kubectl wait --for=jsonpath='{.status.phase}'=Running --timeout=120s hazelcast/hazelcast || kubectl get hazelcasts.hazelcast.com hazelcast -o wide
```
{{exec}}

<details>
<summary>hazelcast.yaml</summary>

```yaml

apiVersion: hazelcast.com/v1alpha1
kind: Hazelcast
metadata:
  name: hazelcast
spec:
  clusterSize: 2
  repository: 'docker.io/hazelcast/hazelcast'
  version: '5.5-slim'
```
</details>

Finally, verify that Hazelcast cluster is up and running by clicking **CHECK** button.
