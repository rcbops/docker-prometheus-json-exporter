docker-prometheus-json-exporter
===============================

A docker image for [prometheus-json-exporter](https://github.com/kawamuray/prometheus-json-exporter)

Build
=====

```sh
docker build . -t xgerman/docker-prometheus-json-exporter
```

Example Usage
=============

```sh
# Start python web server

$ python -m SimpleHTTPServer 8000 &
Serving HTTP on 0.0.0.0 port 8000 ...

# Start exporter
$ docker run -v $PWD:/config -e URL="http://<IP>:8000/example.json" -P -it xgerman/docker-prometheus-json-exporter

#query health
$ docker ps
CONTAINER ID        IMAGE                                     COMMAND                  CREATED             STATUS              PORTS                     NAMES
906f14467a14        xgerman/docker-prometheus-json-exporter   "/bin/sh -c 'json_..."   7 seconds ago       Up 6 seconds        0.0.0.0:32783->7979/tcp   jovial_wing

$ curl localhost:32783/metrics
```