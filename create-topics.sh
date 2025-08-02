#!/bin/bash

# Wait for Kafka to be ready
echo "Waiting for Kafka to be available..."
cub kafka-ready -b kafka:9092 1 20

# --- Define Your Topics Here ---
# Format: {environment}.{appName}.{eventType}

# Amazon Clone Topics
kafka-topics --create --if-not-exists --topic dev.amazon-clone.user-searches --bootstrap-server kafka:9092 --partitions 1 --replication-factor 1
kafka-topics --create --if-not-exists --topic dev.amazon-clone.user-events --bootstrap-server kafka:9092 --partitions 1 --replication-factor 1
kafka-topics --create --if-not-exists --topic dev.amazon-clone.orders --bootstrap-server kafka:9092 --partitions 1 --replication-factor 1

# # Swiggy Clone Topics
# kafka-topics --create --if-not-exists --topic dev.swiggy-clone.restaurant-searches --bootstrap-server kafka:9092 --partitions 1 --replication-factor 1
# kafka-topics --create --if-not-exists --topic dev.swiggy-clone.orders --bootstrap-server kafka:9092 --partitions 1 --replication-factor 1

# # Uber Clone Topics
# kafka-topics --create --if-not-exists --topic dev.uber-clone.ride-requests --bootstrap-server kafka:9092 --partitions 1 --replication-factor 1

echo "Kafka topics created successfully."
