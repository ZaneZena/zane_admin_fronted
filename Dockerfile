# 1. 指定基础镜像：我们不需要 Node环境，只需要 Nginx
# alpine 版本非常小（几兆），适合生产环境
FROM nginx:alpine

# 2. (可选) 维护者信息
LABEL maintainer="your_email@example.com"

# 3. 将我们刚刚写好的 nginx 配置文件复制到容器的配置目录中
# 覆盖 Nginx 默认的 default.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# 4. 将本地生成的 dist 文件夹下的所有文件，复制到 Nginx 的默认 HTML 目录
COPY dist/ /usr/share/nginx/html/

# 5. 暴露端口（Nginx 默认是 80）
EXPOSE 80

# 6. 启动 Nginx
# daemon off; 让 Nginx 在前台运行，保证容器不退出
CMD ["nginx", "-g", "daemon off;"]