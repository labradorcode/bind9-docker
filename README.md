**Usage**

`docker run -d --name bind9 -p 5353:53/udp labradorcode/bind9-alpine:9.16.29-r0`

| Parameter | Description |
| --------- | ----------- |
| -p 5353:53/udp | expose bind9 on 5353 of localhost |
| -v __your_named_conf__:/etc/named.conf | use your own named.conf |
