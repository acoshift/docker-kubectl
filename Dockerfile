FROM alpine
LABEL maintainer="Thanatat Tamtan <acoshift@gmail.com>"

RUN apk add --no-cache ca-certificates

ADD https://storage.googleapis.com/kubernetes-release/release/v1.10.7/bin/linux/amd64/kubectl /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl && kubectl version --client

ENTRYPOINT ["/usr/bin/kubectl"]
