#!/bin/bash

/bin/bash -l -c "bundle install --without development test profile --deployment"
/bin/bash -l -c "bundle exec rake db:create"
/bin/bash -l -c "bundle exec rake assets:precompile db:migrate"
/bin/bash -l -c "bundle exec rake db:seed"
/bin/bash -l -c "bundle exec puma -C config/puma.rb"
