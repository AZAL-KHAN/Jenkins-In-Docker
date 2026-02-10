FROM jenkins/jenkins:lts-jdk21

USER root

# Install prerequisites
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Add Docker GPG key (Debian)
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg \
    -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repo (PINNED to bookworm — NOT trixie)
RUN echo "Types: deb\n\
URIs: https://download.docker.com/linux/debian\n\
Suites: bookworm\n\
Components: stable\n\
Signed-By: /etc/apt/keyrings/docker.asc" \
> /etc/apt/sources.list.d/docker.sources

# Install Docker CLI + Compose plugin ONLY
RUN apt-get update && apt-get install -y \
    docker-ce-cli \
    docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

USER jenkins
