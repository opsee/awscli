FROM gliderlabs/alpine:3.2
MAINTAINER Greg Poirier <greg@opsee.co>

RUN apk add --update bash python py-pip curl && \
    mkdir -p /opt/bin && \
    curl -Lo /opt/bin/ec2-env https://s3-us-west-2.amazonaws.com/opsee-releases/go/ec2-env/ec2-env && \
    pip install --upgrade pip && \
    pip install awscli

COPY awscli.sh /

ENTRYPOINT ["/awscli.sh"]
