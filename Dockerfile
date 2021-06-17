FROM debian:buster-slim

LABEL maintainer "Chaojun Tan <https://github.com/tcjj3>"

ADD entrypoint.sh /opt/entrypoint.sh

RUN export DIR_TMP="$(mktemp -d)" \
  && cd $DIR_TMP \
  && chmod +x /opt/*.sh \
  && sed -i "s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
  && sed -i "s/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
  && apt-get update \
  || echo "continue..." \
  && apt-get install --no-install-recommends -y curl \
                                                ca-certificates \
                                                unzip \
                                                procps \
                                                psmisc \
                                                cron \
                                                vim \
  && mkdir -p /etc/caddy \
  && mkdir -p /opt/file_manager_config \
  && mkdir -p /usr/local/bin/file_manager \
  && mkdir caddy \
  && if [ "$(dpkg --print-architecture)" = "armhf" ]; then \
        ARCH="arm7"; \
     else \
        ARCH=$(dpkg --print-architecture); \
     fi \
  && mkdir -p ${DIR_TMP}/caddy \
  && curl -L -o ${DIR_TMP}/caddy/caddy.tar.gz https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_${ARCH}.tar.gz \
  && tar -zxf ${DIR_TMP}/caddy/caddy.tar.gz -C ${DIR_TMP}/caddy \
  && mv ${DIR_TMP}/caddy/caddy /usr/local/bin/caddy \
  && curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash \
  && rm -rf ${DIR_TMP} \
  && echo "Done."









ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]







