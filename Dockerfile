FROM golang:latest

MAINTAINER German Eichberger <german.eichberger@rackspace.com>
LABEL Description="Provides prometheus json exporter" Version="0.1"

# https://github.com/kawamuray/prometheus-json-exporter

RUN  git clone https://github.com/kawamuray/prometheus-json-exporter.git \
  && cd prometheus-json-exporter \
  && ./gow get \
  && ./gow build -o json_exporter . \
  && mv json_exporter ../bin

# Add a volume so that a host filesystem can be mounted
# Ex. `docker run -v $PWD:/config xgerman/docker-prometheus-json-exporter`
VOLUME ["/config"]
EXPOSE 7979
CMD json_exporter $URL /config/config.yml


