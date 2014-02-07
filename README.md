octopress-nginx
===============

A base container to serve Octopress content using Nginx. Saves memory and deploy time.

You don't need to use Octopress to serve your site - you can just generate the files and use anything - `rake generate`

This is a container that has Ruby and Octopress dependancies available, to compile and build the static site, that nginx serves.

You can use our container: `docker pull octohost/octopress-nginx`

Or you can build your own:

```
docker build -t your-name-here/octopress-nginx .
docker push your-name-here/octopress-nginx
```

After this - just add this Dockerfile to your Harp repo:

```
FROM octohost/octopress-nginx

WORKDIR /srv/www

ADD . /srv/www/
RUN rake generate

EXPOSE 80

CMD nginx
```

Push it to your docker server - and your server will use 4-6MB of RAM instead of 80MB.

To see an example working repo, [take a look here](https://github.com/octohost/octopress).
