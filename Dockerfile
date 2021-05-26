FROM mcr.microsoft.com/dotnet/framework/samples:aspnetapp

COPY web.config C:/inetpub/wwwroot/
MKDIR C:/opt/elastic
COPY ElasticApmAgent_1.9.0/ElasticApmAgentStartupHook.dll :/opt/elastic/

ENV DOTNET_STARTUP_HOOKS=C:/opt/elastic/ElasticApmAgentStartupHook.dll
ENV ELASTIC_APM_SERVER_URLS=https://bhoskins.apm.westus2.azure.elastic-cloud.com
ENV ELASTIC_APM_SECRET_TOKEN=2PEqCucwCrudwLdQhF
ENV ELASTIC_APM_SERVICE_NAME=iis-aspcore-framework