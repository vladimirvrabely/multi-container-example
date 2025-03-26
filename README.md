# multi-container-example

Multi-container example for local development.

The repo contains docker compose files which spin up basic infra and observability services.

## Usage

* Download the files
```sh
curl -sL https://github.com/vladimirvrabely/multi-container-example/archive/refs/heads/main.tar.gz | tar xzf
```
* Create `docker/.env` with the following content
```sh
POSTGRES_USERNAME=postgres
POSTGRES_PASSWORD=123
POSTGRES_PASSWORD_BASE64=(printf $POSTGRES_PASSWORD | base64)
POSTGRES_HOST=postgres
POSTGRES_PORT=5432
POSTGRES_URL=postgresql://$POSTGRES_USERNAME:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT

VALKEY_URL=redis://valkey:6379

KAFKA_BOOTSTRAP_SERVERS=kafka:29092

MQTT_BROKER_URL=mqtt://mqtt:1884

# OTEL_EXPORTER_OTLP_METRICS_ENDPOINT=http://prometheus:9090/api/v1/otlp/v1/metrics
OTEL_EXPORTER_OTLP_METRICS_ENDPOINT=grpc://opentelemetry-collector:4317/metrics
OTEL_EXPORTER_OTLP_PROTOCOL=grpc
OTEL_METRIC_EXPORT_INTERVAL=2000

GF_SECURITY_ADMIN_USER=gfn
GF_SECURITY_ADMIN_PASSWORD=gfn
```

* Start containers using `justfile` commands
```sh
just up infra
just up observability
```

* Play around and check out grafana for instance on `localhost:3000` with the above credentials

* Stop the container using `justfile`
```sh
just down infra
just down observability
```

