kubectl create namespace mongo-operator
kubectl apply -f deploy/clusterwide
kubectl apply -k config/rbac/
kubectl apply -f config/crd/bases/mongodbcommunity.mongodb.com_mongodbcommunity.yaml
kubectl apply -k config/rbac/ --namespace mongo-operator
kubectl create -f config/manager/manager.yaml --namespace mongo-operator

kubectl create namespace mongo-sink
kubectl apply -k config/rbac/ --namespace mongo-sink
kubectl apply -f sink.yaml --namespace mongo-sink

kubectl create namespace mongo-source
kubectl apply -k config/rbac/ --namespace mongo-source
kubectl apply -f source.yaml --namespace mongo-source

kubectl apply -f nodeports.yaml