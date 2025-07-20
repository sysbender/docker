# reference

https://facsiaginsa.com/janus/basic-janus-configuration-with-ssl


# About

This project demonstrates how to run the Janus SIP demo using docker-janus-gateway with a custom docker-compose setup.

It uses Nginx to:

Serve the static SIP demo HTML/JS files.

Act as a reverse proxy for the Janus WebSocket and REST endpoints.

This provides a fully self-contained, containerized setup to experiment with WebRTC SIP integrations.


## folder structure

```shell
janus-sip-docker/
├── docker-compose.yml
├── nginx/
│   ├── default.conf
├── sip-demo/
│   ├── index.html
│   └── js/
│       └── siptest.js
└── README.md

```




# Janus SIP Docker Demo

This is a self-contained Docker environment to run the Janus WebRTC SIP demo with Nginx and docker-janus-gateway.

## Features

- Janus gateway via official `docker-janus-gateway` image
- Nginx serves SIP static demo and proxies Janus API/WebSocket
- Single-command setup with Docker Compose

## Usage

```bash
git clone https://github.com/yourname/janus-sip-docker
cd janus-sip-docker
docker-compose up
```

## Ports
80: Nginx static files + proxy

8188: Janus WebSocket (internal)

8088: Janus HTTP (internal)