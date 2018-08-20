FROM node:8-alpine
LABEL maintainer "huangzulin<335882264@qq.com>"
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
  apk update && \
  apk add --no-cache git && \
  git clone https://gitee.com/zulin/vue-init.git source && \
  cd /source && \
  npm install cnpm -g --registry=https://registry.npm.taobao.org && \
  cnpm install && \
  npm run build

FROM nginx:1-alpine
WORKDIR /usr/share/nginx/html
COPY --from=0 /source/dist/ /usr/share/nginx/html/


