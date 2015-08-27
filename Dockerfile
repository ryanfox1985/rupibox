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
RUN /bin/bash -l -c "curl -sSL https://rvm.io/mpapis.asc | gpg --import -"
RUN /bin/bash -l -c "curl -sSL https://get.rvm.io | bash -s stable"
RUN /bin/bash -l -c "rvm install 2.1.6"
RUN /bin/bash -l -c "echo 'gem: --no-ri --no-rdoc' > ~/.gemrc"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

ENV APP_HOME /var/www
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*