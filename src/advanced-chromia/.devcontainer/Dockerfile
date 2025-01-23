FROM mcr.microsoft.com/devcontainers/java:1-21-bullseye

ARG INSTALL_MAVEN="true"
ARG MAVEN_VERSION=""

ARG INSTALL_GRADLE="false"
ARG GRADLE_VERSION=""

RUN if [ "${INSTALL_MAVEN}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/sdkman/bin/sdkman-init.sh && sdk install maven \"${MAVEN_VERSION}\""; fi \
    && if [ "${INSTALL_GRADLE}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/sdkman/bin/sdkman-init.sh && sdk install gradle \"${GRADLE_VERSION}\""; fi

USER root
RUN apt-get update

# NPM as everything seems to need that
RUN curl -fsSL https://deb.nodesource.com/setup_23.x | bash
RUN apt-get install -y nodejs

# We will want a postgres client too
RUN apt-get install -y postgresql-client

# Need yq for for the Bridge Demo later
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

# Install CHR and PMC
RUN curl -fsSL https://apt.chromia.com/chromia.gpg > /usr/share/keyrings/chromia.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/chromia.gpg] https://apt.chromia.com stable main" | tee /etc/apt/sources.list.d/chromia.list
RUN apt-get update
RUN apt-get download chr:amd64
RUN dpkg --force-architecture --ignore-depends=chr -i chr_*.deb || true; rm chr_*_amd64.deb
RUN apt-get download pmc:amd64
RUN dpkg --force-architecture -i pmc_*.deb && rm pmc_*_amd64.deb

# Install the demo Bridge UX
RUN cd /opt
RUN git clone https://bitbucket.org/chromawallet/chromia-bridge-demo.git
RUN cd chromia-bridge-demo/rell
RUN chr build
RUN yq -i 'blockchains.event_receiver.eif.chains.local.contracts = strenv(EVM_BRIDGE_ADDRESS)' ./rell/chromia.yml
