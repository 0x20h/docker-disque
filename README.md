# 0x20h/docker-disque

git build of Disque running under supervisor.

I use this to start/stop cluster nodes for testing my [client implementation](https://github.com/0x20h/phloppy) 
without stopping the container.

## usage

```
docker pull 0x20h/disque
for i in 1 2 3; do
   docker run --rm --name disque_$i 0x20h/disque -d
done;

# have fun
```

## License

MIT
