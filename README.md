# docker-consul

Usage: 

```shell
docker run -p 8400:8400 -p 8500:8500 -p 8600:53/udp -h consul-${hostname} -d mschewe/consul -server -bootstrap
```
