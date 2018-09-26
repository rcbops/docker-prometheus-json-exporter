FROM golang:1.10 as build

WORKDIR /go

RUN  git clone https://github.com/kawamuray/prometheus-json-exporter.git \
  && cd prometheus-json-exporter \
  && ./gow get \
  && CGO_ENABLED=0 GOOS=linux ./gow build -o json_exporter .


FROM alpine:3.8

COPY --from=build /go/prometheus-json-exporter/json_exporter /usr/bin/

# Add a volume so that a host filesystem can be mounted
# Ex. `docker run -v $PWD:/config xgerman/docker-prometheus-json-exporter`
VOLUME ["/config"]
EXPOSE 7979

CMD json_exporter $URL /config/config.yml


