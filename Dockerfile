FROM ubuntu:14.04

# Update ubuntu and install applications
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y git

# Install and configure golang
RUN wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
RUN tar -C /usr/local -xf go1.8.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=$HOME/go
ENV PATH=$GOPATH/bin:$PATH

# Add our application
ADD App.go $GOPATH/src/myapp/

# Build application
RUN go build myapp

EXPOSE 8080

ENTRYPOINT ./myapp
