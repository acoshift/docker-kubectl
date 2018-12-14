FROM alpine
LABEL maintainer="Thanatat Tamtan <acoshift@gmail.com>"

RUN apk add --no-cache bash ca-certificates

ADD https://storage.googleapis.com/kubernetes-release/release/v1.13.1/bin/linux/amd64/kubectl /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl
COPY kubectl.bash /usr/bin/kubectl.bash

ENTRYPOINT ["/usr/bin/kubectl.bash"]
