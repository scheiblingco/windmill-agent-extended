ARG AGENT_VERSION
FROM ghcr.io/windmill-labs/windmill:${AGENT_VERSION}


RUN curl -sSL -O https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql17 msodbcsql18 mssql-tools unixodbc-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
