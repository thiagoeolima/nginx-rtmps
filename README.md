# nginx-rtmps

[**Docker**](https://www.docker.com/) image with [**Nginx**](http://nginx.org/en/)
using the [**nginx-rtmp-module**](https://github.com/arut/nginx-rtmp-module)
module for streaming and [**Stunnel**](https://www.stunnel.org/) to add TLS encryption functionality.

## Description

This [**Docker**](https://www.docker.com/) image can be used to create an RTMP server for multimedia / video 
streaming using [**Nginx**](http://nginx.org/en/), [**nginx-rtmp-module**](https://github.com/arut/nginx-rtmp-module) 
and [**Stunnel**](https://www.stunnel.org/),
built from the current latest sources (Nginx 1.18.0 , nginx-rtmp-module 1.2.1 and Stunnel 4).

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
docker run -it -p 1935:1935 --name nginx-rtmps thiagoeolima/nginx-rtmps
```

* Facebook and Youtube:

```bash
docker run -it -p 1935:1935 -e FACEBOOK_KEY="<key>" -e YOUTUBE_KEY=<key> thiagoeolima/nginx-rtmps
```

* Cloudflare:

```bash
docker run -it -p 1935:1935 -e CLOUDFLARE_KEY="<key>" thiagoeolima/nginx-rtmps
```

* Twitch:

```bash
docker run -it -p 1935:1935 -e TWITCH_URL="rtmp://<url>" -e TWITCH_KEY="<key>" thiagoeolima/nginx-rtmps
```

* Kick:

```bash
docker run -it -p 1935:1935 -e KICK_KEY="<key>" thiagoeolima/nginx-rtmps
```

* OBS

```bash
rtmp://localhost:1935/live
```

* Instagram:

```bash
docker run -it -p 1935:1935 -e INSTAGRAM_KEY=<key> thiagoeolima/nginx-rtmps
```

* OBS

```bash
rtmp://localhost:1935/instagram
```


## How to test with OBS Studio

* Run a container with the command above


* Open [OBS Studio](https://obsproject.com/)
* Click the "Settings" button
* Go to the "Stream" section
* In "Stream Type" select "Custom Streaming Server"
* In the "URL" enter the `rtmp://<ip_of_host>/live` replacing `<ip_of_host>` with the IP of the host in which the container is running. For example: `rtmp://192.168.0.30/live`
* In the "Stream key" use a "key" that will be used later in the client URL to display that specific stream. For example: `test`
* Click the "OK" button
* In the section "Sources" click de "Add" button (`+`) and select a source (for example "Screen Capture") and configure it as you need
* Click the "Start Streaming" button

## Debugging

If something is not working you can check the logs of the container with:

```bash
docker logs nginx-rtmps
```

## Extending

If you need to modify the configurations you can create a file `nginx.conf` and replace the one in this image using a `Dockerfile` that is based on the image, for example:

```Dockerfile
FROM thiagoeolima/nginx-rtmps

COPY nginx.conf /etc/nginx/nginx.conf
```

The current `nginx.conf` contains:

```Nginx
worker_processes auto;
rtmp_auto_push on;
rtmp_auto_push_reconnect 1s;
events {}
rtmp {
    server {
        listen 1935;
        listen [::]:1935 ipv6only=on;
        chunk_size 4096;

        application live {
            live on;
            record off;

        #-YouTube
        #push rtmp://a.rtmp.youtube.com/live2/<key>;
        #-Facebook;
        #push rtmp://127.0.0.1:19350/rtmp/<key>;
        #-Instagram;
        #push rtmp://127.0.0.1:19351/rtmp/<key>;
        #-Cloudflare
        #push rtmp://127.0.0.1:19352/live/<key>;
        #-Kick
        #push rtmp://127.0.0.1:19353/kick/<key>;
        }
        
        application instagram {
            live on;
            record off;
            
            #-Instagram;
            #push rtmp://127.0.0.1:19351/rtmp/<key>;
        }

    }

}

```
