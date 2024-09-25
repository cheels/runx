In this step, you will deploy Hazelcast Platform Operator.
From release 5.6.0 onwards, you can use a Helm chart to install the Hazelcast Platform Operator.


1. Add the Hazelcast Helm Charts repository to your Helm repository list by running the following command:
    ```
    helm repo add hazelcast https://hazelcast-charts.s3.amazonaws.com/
    helm repo update
    ```{{exec}}

2. Run the following command to deploy the Operator and the CRDs together.
    ```
    helm install operator hazelcast/hazelcast-platform-operator --version=5.13.0 \
    --set=installCRDs=true
    ```{{exec}}
