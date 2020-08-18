利用openresty/nginx实现商品详情页静态化与多级缓存


1.在项目中建立redis集群缓存


2.以docker创建三个openresty镜像，一个作为分发层，两个作为应用层
docker run -d --name server1 -p 8091:80  openresty/openresty
docker run -d --name server2 -p 8092:80  openresty/openresty
docker run -d --name distributor1 -p 8093:80  openresty/openresty
然后配置nginx.conf和conf/lua/phone.lua，与项目整合
具体配置在项目的openresty文件夹中