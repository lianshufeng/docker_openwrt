FROM alpine as builder
RUN mkdir -p /tmp/openwrt
RUN wget https://downloads.openwrt.org/releases/21.02.0/targets/x86/64/openwrt-21.02.0-x86-64-rootfs.tar.gz -O /tmp/openwrt/openwrt.tar.gz
RUN cd /tmp/openwrt ; tar -xvzf ./openwrt.tar.gz; rm -rf openwrt.tar.gz

FROM alpine
COPY --from=builder /tmp/openwrt /
EXPOSE 80




CMD ["sbin/init"]

# docker run -i -t openwrt /bin/sh
# docker rm -f openwrt ;docker run --name  openwrt -d -p 80:80 openwrt
# docker run -i openwrt /sbin/init