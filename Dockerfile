FROM hypriot/rpi-ruby
MAINTAINER ryanfox1985 <wolf.fox1985@gmail.com>

# Update and upgrade
RUN apt-get -q update
RUN apt-get -qy upgrade

# Install packages
RUN apt-get install -qy build-essential nodejs curl sqlite3 libsqlite3-dev

RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
RUN gem install bundler --no-ri --no-rdoc

ENV APP_HOME /var/www
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

EXPOSE 3000
CMD ["./start.sh"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
