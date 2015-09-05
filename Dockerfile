FROM gliderlabs/alpine:3.2
MAINTAINER Greg Poirier <greg@opsee.co>

PATH=/opt/bin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin

RUN apk add --update bash python py-pip curl && \
    mkdir -p /opt/bin && \
    curl -Lo /opt/bin/ec2-env https://s3-us-west-2.amazonaws.com/opsee-releases/go/ec2-env/ec2-env && \
    chmod 755 /opt/bin/ec2-env && \
    pip install --upgrade pip && \
    pip install awscli

COPY awscli.sh /

ENTRYPOINT ["/awscli.sh"]
