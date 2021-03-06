# node-rfc-docker

Example to use node-rfc in a Docker container.

This is a simple Node.js example that compiles the node-rfc binding from source
during the `npm install`.

The `app.js` only implements minimal steps to check if loading the node-rfc
module can be loaded and the shared libs can be found.

## Linux container

### Download SAP NW RFC SDK

Download the SAP NW RFC SDK and SAR tool for Linux into the `download` folder.

Example:

```
$ ls -l download/
total 25312
-rw-r--r--  1 stefan  staff  8544727 Dec  4 21:09 NWRFC_38-20004565.SAR
-rw-r--r--  1 stefan  staff  4410688 Dec  4 21:09 SAPCAR_0-80000935.EXE
```

### Build the Docker image

```
docker build -t node-rfc-docker .
```

### Test the container

Run the container with

```
docker run node-rfc-docker
```

It should show you

```
All libs loaded.
```

## Windows container

### Download SAP NW RFC SDK

Download the SAP NW RFC SDK and SAR tool for Windows into the `download` folder.

Example:

```
$ ls -l download/
total 22768
-rw-r--r--  1 stefan  staff  7172760 Dec  4 22:00 NWRFC_38-20004568.SAR
-rw-r--r--  1 stefan  staff  4480208 Dec  4 21:59 SAPCAR_617-80000938.EXE
```

### Build the Docker image

```
docker build -t node-rfc-docker -f Dockerfile.windows .
```

### Test the container

Run the container with

```
docker run node-rfc-docker
```

It should show you

```
All libs loaded.
```
