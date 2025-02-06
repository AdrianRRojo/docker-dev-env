## Docker ##

This is a Dockerfile for building a Docker image for my dev environment. Will be edited over time.

### Volume ###

```bash
docker volume create dev-volume
```

### Pull ###

```bash
docker pull adrianrojo/dev-env:latest
```

### Create container ###
<!-- This opens ports 8080, 22, 443, and 80 for the container, and mounts the volume to the container -->
```bash
docker run -it --name dev-container -v dev-volume:/arojo-dev -p 8080:8080 -p 22:22 -p 443:443 -p 80:80 adrianrojo/dev-env:latest
```

