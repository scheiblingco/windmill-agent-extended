ARG AGENT_VERSION
FROM ghcr.io/windmill-labs/windmill:${AGENT_VERSION}

RUN curl https://packages.microsoft.com/config/debian/12/prod.list | tee /etc/apt/sources.list.d/mssql-release.list \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools unixodbc-dev msodbcsql18 \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*
