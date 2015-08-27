FROM resin/rpi-raspbian:wheezy
MAINTAINER ryanfox1985 <wolf.fox1985@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Update and upgrade
RUN apt-get -q update
RUN apt-get -qy upgrade

# Install packages
RUN apt-get install -qy build-essential nodejs git-core curl

# RVM
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -sSL https://get.rvm.io | bash -s stable

#INSTALL RUBY
RUN /usr/local/rvm/bin/rvm install 2.1.6
RUN /usr/local/rvm/bin/rvm use --default 2.1.6

RUN gem install bundler

ENV APP_HOME /var/www
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*