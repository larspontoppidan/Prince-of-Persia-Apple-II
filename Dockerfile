FROM i386/ubuntu:18.04

ARG UID
ARG GID

RUN groupadd --gid $GID hostuser && \
    useradd --uid $UID --gid $GID hostuser

# Install basic build orchestration tools:
RUN apt-get update && apt-get install -y \
    make \
    && apt-get clean

# Set default user to hostuser
USER hostuser
