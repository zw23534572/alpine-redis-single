FROM registry.cn-shenzhen.aliyuncs.com/sjroom/alpine-base
ENV REDIS_VERSION=4.0.11-r0

# Install redis.
RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache redis=$REDIS_VERSION && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /data/redis && \
    chown -R redis:redis /data/redis

## 创建一个redis.conf文件，打开集群相关配置，默认端口不写的话为6379
RUN echo "protected-mode no" > /etc/redis.conf

# Expose the ports for redis.
EXPOSE 6379

COPY start.sh /export/servers/redis/start.sh
RUN  chmod +x /export/servers/redis/start.sh

#启动、停止脚本(sprintboot)
RUN echo "sh /export/servers/redis/start.sh" >> /export/servers/script/start.sh
# RUN echo "sh /export/App/service.sh stop" >> /export/servers/script/stop.sh