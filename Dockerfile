FROM docker.io/alpine:latest

ENV PLANTUML_VERSION 1.2021.11
ENV LANG en_US.UTF-8
RUN apk add --no-cache openjdk8-jre graphviz ttf-droid ttf-droid-nonlatin curl gosu \
    && mkdir /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
    && apk del curl

COPY entrypoint.sh /entrypoints

ENTRYPOINT [ "/entrypoints/entrypoint.sh" ]
