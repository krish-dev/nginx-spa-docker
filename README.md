## Execute the following command to build the docker image.

```
docker build -t spa-nginx .
```

## After the build is successfully finished, we can check to see if it appears in the list of docker images available locally. To do so, we can execute the below command.

```
docker image ls
```
## Now that we see our image is in the list, we can run the image using following command.

```
docker run -p 8000:8080 -d spa-nginx
```
