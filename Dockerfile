FROM ubuntu:18.04

RUN apt-get update && apt-get install -y quagga tcpdump iproute2

COPY config/* /etc/quagga/
COPY entrypoint.sh /
RUN mkdir -p /run/quagga && chown -R quagga.quaggavty /etc/quagga /run/quagga

VOLUME /etc/quagga
WORKDIR /etc/quagga

CMD ["zebra"]
ENTRYPOINT ["/entrypoint.sh"]
