FROM octohost/ruby-1.9

RUN mkdir /srv/www

WORKDIR /srv/www

RUN curl -o Gemfile https://raw.github.com/octohost/octopress/master/Gemfile && bundle install --system

RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get -y install nginx

ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf