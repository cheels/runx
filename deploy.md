Add the Hazelcast Helm Charts repository to your Helm repository list by running the following command:
```plain
helm repo add hazelcast https://hazelcast-charts.s3.amazonaws.com/
helm repo update
```{{exec}}

Run the following command to deploy the Operator and the CRDs together.

```plain
helm install operator hazelcast/hazelcast-platform-operator --version=5.12.0 \
    --set=installCRDs=true
```{{exec}}
