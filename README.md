# IS373 Practical Test

## Website URLs

**Production:** https://fwang-is373.lol

**QA:** https://qa.fwang-is373.lol

## Project Overview

This project deploys a containerized Nginx website to a DigitalOcean Ubuntu server using Docker, Traefik, GitHub Actions, and GitHub Container Registry.

Both environments use HTTPS certificates provided by Let's Encrypt.

## CI/CD Process

GitHub Actions automatically validates, builds, publishes, and deploys the website whenever changes are pushed.

1. Changes pushed to the `qa` branch deploy to the QA environment.
2. Changes pushed to `main` deploy to production.
3. The workflow validates the website and Docker Compose configuration before building.
4. Docker images are built and pushed to GitHub Container Registry.
5. The server downloads the appropriate image and restarts the corresponding container.
6. Failed validation or build steps prevent deployment.

GitHub Actions repository secrets securely store the SSH deployment credentials and server information.

## Test Evidence

**Successful QA workflow:**

https://github.com/FangzeW1/is373-practical-test/actions/runs/37819665336

**Successful production workflow:**

https://github.com/FangzeW1/is373-practical-test/actions/runs/37819784619

**Docker image registry:**

https://github.com/FangzeW1/is373-practical-test/pkgs/container/is373-practical-test

**Deployed commit:** `f67983e`

**Docker image tags:**
- `ghcr.io/fangzew1/is373-practical-test:qa`
- `ghcr.io/fangzew1/is373-practical-test:main`

## Server Security

The DigitalOcean server uses a non-root user named `fwang` with SSH key authentication and sudo access.

Security measures include:

- Root SSH login disabled.
- Password SSH authentication disabled.
- UFW firewall allowing SSH, HTTP, and HTTPS.
- Fail2ban enabled.
- Automatic security updates enabled.
- Docker application containers configured with reduced privileges.

## QA to Production Promotion

A visible website change was deployed through the `qa` branch first.

The QA workflow completed successfully, and the change appeared on the QA website. The same change was then promoted to `main`, triggering a successful production deployment.

Both websites now display Version 2.

## Screenshots

Add screenshots here showing:

- QA website with Version 2.
- Production website with Version 2.
- Successful GitHub Actions workflows.
- SSH security configuration and verification.
