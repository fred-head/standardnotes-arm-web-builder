# Standard Notes ARM Web App

ARM64 Docker image for the Standard Notes web application with runtime-configurable API endpoint support.

Designed for ARM-based environments such as Oracle Cloud Infrastructure (OCI) Ampere A1 instances, Raspberry Pi, and other ARM64 platforms.

## Features

- ARM64 native image
- Automatic builds from the latest Standard Notes release
- Runtime API URL configuration
- Published to GitHub Container Registry (GHCR)
- Suitable for OCI Free Tier ARM instances

## Quick Start

### Docker

```bash
docker run -d \
  --name standardnotes-web \
  -p 8080:80 \
  -e DEFAULT_SYNC_SERVER=https://notes-api.example.com \
  ghcr.io/fred-head/standardnotes-arm-web:latest
```

### Docker Compose

```yaml
services:
  standardnotes-web:
    image: ghcr.io/fred-head/standardnotes-arm-web:latest
    container_name: standardnotes-web
    restart: unless-stopped

    environment:
      SYNC_SERVER: https://notes-api.example.com

    ports:
      - "8080:80"
```

## Environment Variables

| Variable | Required | Description |
|-----------|----------|-------------|
| `DEFAULT_SYNC_SERVER` | Yes | URL of your Standard Notes Sync Server |

Example:

```yaml
environment:
  DEFAULT_SYNC_SERVER: https://notes-api.example.com
```

## Available Tags

| Tag | Description |
|------|-------------|
| `latest` | Latest Standard Notes release |
| `x.y.z` | Specific Standard Notes version |

Example:

```text
ghcr.io/fred-head/standardnotes-arm-web:latest
ghcr.io/fred-head/standardnotes-arm-web:3.201.21
```

## Automated Builds

This repository automatically:

1. Checks for new Standard Notes releases
2. Builds an ARM64 image
3. Publishes the image to GHCR

No manual build process is required.

## Tested Platforms

- Oracle Cloud Infrastructure Ampere A1
- Ubuntu 24.04 ARM64
- Docker Engine 28+
- Docker Compose v2

## Disclaimer

This project is not affiliated with Standard Notes.

Standard Notes is a trademark of Standard Notes Ltd.