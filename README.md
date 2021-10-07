# KAFKA CONNECT using Strimzi

## Deploy in minikube
**Develop Apache Kafka with Strimzi and Minikube**
```
$ minikube start --driver=hyperkit --cpus 4 --memory 8192

$ kubectl create namespace kafka

$ curl -L0 https://strimzi.io/install/latest | sed 's/namespace: .*/namespace: kafka/' | kubectl apply -f - -n kafka

$ kubectl apply -f kafka/kafka-persistent-single.yml

$ cd mongodb

$ ./setup.sh

$ cd ..

$ kubectl apply -f connect
```        

## Enable access to mongodb

```
$ minikube service --url mongodb-source-np -n mongo-source
$ minikube service --url mongodb-sink-np -n mongo-sink
```

## Insert data in mongodb data source by console

**Get mongodb data source pod** 
```
$ kubectl get pods -n mongo-source
```
**Enter the pod to insert data**
```
$ kubectl exec -it <NAME_POD> -n mongo-source -- sh
```
**Execute (insert data in source)**
```
$ mongo -uadmin -ppassword
$ use education
$ db.students.insert({  "name": "Bill Gates", "phone": "1111" })
$ db.students.insert({  "name": "Mark Zuckerberg", "phone": "2222" })
$ db.students.insert({  "name": "Larry Page", "phone": "3333" })
$ db.students.insert({  "name": "Jeff Bezos", "phone": "4444" })
$ db.students.find()
$ exit
```

## Verify data in mongodb data sink by console

**Get mongodb data sink pod** 
```
$ kubectl get pods -n mongo-sink
```
**Enter the pod to verify data**
```
$ kubectl exec -it <NAME_POD> -n mongo-sink -- sh
```
**Execute (verify data in sink)**

```
$ mongo -uadmin -ppassword
$ use education
$ db.students.find()
$ exit
```

## Note

For KafkaConnect the image "hectorph85/strimzi-kafkaconnect-mongodb:0.25.0" is used that can see the Dockerfile in [docker](docker)