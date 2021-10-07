FROM quay.io/strimzi/kafka:0.25.0-kafka-2.8.0
USER root:root
COPY ./jars/libs/ /opt/kafka/libs/
COPY ./jars/plugins/ /opt/kafka/plugins/
USER 1001