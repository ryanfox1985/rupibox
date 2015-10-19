FROM hypriot/rpi-alpine-scratch
MAINTAINER ryanfox1985 <wolf.fox1985@gmail.com>

ENV BUILD_PACKAGES curl-dev ruby-dev sqlite-libs build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler

# Update and upgrade
RUN apk update
RUN apk upgrade
RUN apk add bash $BUILD_PACKAGES $RUBY_PACKAGES

RUN wget http://nl.alpinelinux.org/alpine/v3.1/main/armhf/libuv-0.10.29-r0.apk -O /var/cache/apk/libuv.apk
RUN wget http://nl.alpinelinux.org/alpine/v3.1/main/armhf/nodejs-0.10.33-r0.apk -O /var/cache/apk/nodejs.apk
RUN apk add --allow-untrusted /var/cache/apk/libuv.apk /var/cache/apk/nodejs.apk

RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
RUN gem install bundler --no-ri --no-rdoc

ENV APP_HOME /var/www
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Clean up APT when done.
RUN rm -rf /var/cache/apk/*

EXPOSE 3000
CMD ["start.sh"]