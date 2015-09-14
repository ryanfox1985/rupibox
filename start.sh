#!/bin/bash

bundle install --without development test profile --deployment
bundle exec rake db:create db:migrate db:seed
bundle exec rake assets:precompile
bundle exec puma -C config/puma.rb
