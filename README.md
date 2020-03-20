# nginx-rtmps

[**Docker**](https://www.docker.com/) image with [**Nginx**](http://nginx.org/en/)
using the [**nginx-rtmp-module**](https://github.com/arut/nginx-rtmp-module)
module for streaming and [**Stunnel**](https://www.stunnel.org/) to add TLS encryption functionality.

## Description

This [**Docker**](https://www.docker.com/) image can be used to create an RTMP server for multimedia / video 
streaming using [**Nginx**](http://nginx.org/en/), [**nginx-rtmp-module**](https://github.com/arut/nginx-rtmp-module) 
and [**Stunnel**](https://www.stunnel.org/),
built from the current latest sources (Nginx 1.16.1 , nginx-rtmp-module 1.2.1 and Stunnel 4).

This was inspired by other similar previous images from [tiangolo](https://hub.docker.com/r/tiangolo/nginx-rtmp/),
[dvdgiessen](https://hub.docker.com/r/dvdgiessen/nginx-rtmp-docker/), 
[jasonrivers](https://hub.docker.com/r/jasonrivers/nginx-rtmp/), 
[aevumdecessus](https://hub.docker.com/r/aevumdecessus/docker-nginx-rtmp/) and by an 
[OBS Studio post](https://obsproject.com/forum/resources/how-to-set-up-your-own-private-rtmp-server-using-nginx.50/).

The main purpose (and test case) to build it was to allow streaming from 
[**OBS Studio**](https://obsproject.com/) to different clients at the same time.

**GitHub repo**: <https://github.com/thiagoeolima/nginx-rtmps>

**Docker Hub image**: <https://hub.docker.com/r/thiagoeolima/nginx-rtmps/>

## Details

## How to use

* For the simplest case, just run a container with this image:

```bash
docker run -d -p 1935:1935 --name nginx-rtmps thiagoeolima/nginx-rtmps
```

* Facebook and Youtube:

```bash
docker run -p 1935:1935 -e FACEBOOK_KEY=<key> -e YOUTUBE_KEY=<key> thiagoeolima/nginx-rtmps
```
