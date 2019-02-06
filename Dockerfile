FROM        quay.io/prometheus/busybox:latest
LABEL maintainer="NGP Monitoring Team <ngp.monitoring@sabre.com>"

COPY thanos-receiver thanos-receiver

RUN mkdir -p /thanos-receiver && \
    chown -R nobody:nogroup etc/thanos-receiver /thanos-receiver && \
    ln -s /thanos-receiver /etc/thanos-receiver/data

USER       nobody
EXPOSE     19291
VOLUME     [ "/thanos-receiver" ]
WORKDIR    /etc/thanos-receiver
ENTRYPOINT [ "/bin/thanos-receiver" ]