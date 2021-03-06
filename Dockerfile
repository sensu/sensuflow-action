# Container image that runs your code
FROM sensu/sensu:latest
RUN echo 'http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
RUN apk update
RUN apk add jq yq curl

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY sensuflow.sh /sensuflow.sh
# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/sensuflow.sh"]

