FROM mcr.microsoft.com/dotnet/framework/samples:aspnetapp

#COPY web.config C:/inetpub/wwwroot/
RUN mkdir C:/opt/elastic
RUN curl "https://github.com/elastic/apm-agent-dotnet/releases/download/1.9.0/ElasticApmAgent_1.9.0.zip" -o C:\opt\elastic\apm.zip
RUN powershell -command Expand-Archive -Path C:\opt\elastic\apm.zip -DestinationPath C:\opt\elastic\ElasticApmAgent_1.9.0
RUN rm C:\opt\elastic\apm.zip

ENV DOTNET_STARTUP_HOOKS=C:/opt/elastic/ElasticApmAgent_1.9.0/ElasticApmAgentStartupHook.dll
ENV ELASTIC_APM_SERVER_URLS=
ENV ELASTIC_APM_SECRET_TOKEN=
ENV ELASTIC_APM_SERVICE_NAME=
