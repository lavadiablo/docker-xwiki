# start docker process
docker run --name xwikiDB -p 5432:5432 -e POSTGRES_USER=xwiki -e POSTGRES_PASSWORD=xwiki -v /usr/share/docker/persistance/xwiki/db:/var/lib/postgresql/data -d postgres 
docker run -p 80:8080 --name xwiki -v /usr/share/docker/persistance/xwiki/files:/var/local/xwiki --link xwikiDB:xwikidb -d lavadiablo/docker-xwiki
