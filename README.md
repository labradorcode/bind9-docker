[![ci](https://github.com/labradorcode/bind9-docker/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/labradorcode/bind9-docker/actions/workflows/docker-image.yml)

**Specs**
Base image Alpine Edge


**Usage**

`docker run -d --name bind9 -p 5353:53/udp labradorcode/bind9:9.18.3-r2`

| Parameter | Description |
| --------- | ----------- |
| -p 5353:53/udp | expose bind9 on 5353 of localhost |
| -v __your_named_conf__:/etc/named.conf | use your own named.conf |
