# Infra

Infra

# Platform Infrastructure

This repository manages the shared infrastructure for the Plug-and-Play Agentic AI platform. It currently includes the central Kafka cluster used for event streaming between all B2C client applications and the core Agentic AI SDK.

## Prerequisites

- Docker
- Docker Compose

## How to Run

1.  **Clone the repository:**

    ```bash
    git clone <your-repo-url>/pap-platform-infra.git
    cd pap-platform-infra
    ```

2.  **Start the services:**
    From the root directory, run the following command. This will read the `.env` file and start the services defined in `kafka/docker-compose.yml`.

    ```bash
    docker-compose -f docker-compose.yml --env-file .env up -d
    ```

3.  **Verify the services are running:**

    ```bash
    docker ps
    ```

    You should see containers named `kafka`, `zookeeper`, `redpanda-console`, and `topic-creator`.

4.  **Access the Kafka UI (Redpanda Console):**
    Open your browser and navigate to [http://localhost:8080](http://localhost:8080) (or whichever port you defined in `.env`). You should be able to see the broker and the topics that were created.

## Connecting to Kafka from Other Services

- **Kafka Broker Address:** `localhost:29092` (or `localhost:${KAFKA_EXTERNAL_PORT}`)
- **Topic Naming Convention:** `{environment}.{appName}.{eventType}` (e.g., `dev.amazon-clone.orders`)

Your application backends (Producers) and the Agentic AI SDK (Consumer) should use the address above to connect to this central Kafka instance.

# .env

```
# -------------------------------------
# External Ports - Change these if they conflict with other local services
# -------------------------------------

# Port for external clients (your Next.js apps, local SDK) to connect to Kafka
KAFKA_EXTERNAL_PORT=29092

# Port for the Kafka Management UI
REDPANDA_CONSOLE_PORT=8080
```
