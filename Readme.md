docker-prometheus-json-exporter
===============================

A docker image for [prometheus-json-exporter](https://github.com/kawamuray/prometheus-json-exporter)

Build and push
==============

```sh
docker build . -t quay.io/rackspace/prometheus-json-exporter:$(git describe --always)
docker push quay.io/rackspace/prometheus-json-exporter:$(git describe --always)
```

Example Usage
=============

```sh
# Start python web server
$ python -m SimpleHTTPServer 8000 &

# Start exporter
$ docker run -it \
    -p 7979:7979 \
    -v $PWD:/config \
    -e URL="http://<my.local.ip.addr>:8000/registry_example.json" \
    quay.io/rackspace/prometheus-json-exporter:$(git describe --always)

# Query metrics
$ curl http://localhost:7979/metrics
```

Note
====

The example is based on the docker registry output and can be used to establish prometheus monitoring for a private docker regsitry.
