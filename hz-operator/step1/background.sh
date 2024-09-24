sudo apt-get install -y whiptail
cat << 'EOF' > password_prompt.sh
while true; do
    LICENSE_KEY=$(whiptail --passwordbox "Please enter your License Key" 8 78 --title "License key" --nocancel 3>&1 1>&2 2>&3)
    if [ -n "$LICENSE_KEY" ]; then
        echo "$LICENSE_KEY"
        break
    fi
done
EOF

chmod +x password_prompt.sh

CLUSTER_NAME=$(kubectl config view --minify -o jsonpath='{.clusters[0].name}')

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb-native.yaml
kubectl wait --for=condition=ready --timeout=60s -n metallb-system pod -l app=metallb
HOST_MIN=$(docker network inspect -f '{{json .IPAM.Config}}' $CLUSTER_NAME | jq -r '.[1].Subnet' |  sed  -n 's/.0.0.16/.255.200/p')
HOST_MAX=$(docker network inspect -f '{{json .IPAM.Config}}' $CLUSTER_NAME | jq -r '.[1].Subnet' |  sed  -n 's/.0.0.16/.255.250/p')
IP_RANGE=$HOST_MIN-$HOST_MAX

cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: kind-pool
  namespace: metallb-system
spec:
  addresses:
  - $IP_RANGE
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: l2
  namespace: metallb-system
spec:
  ipAddressPools:
  - kind-pool
EOF