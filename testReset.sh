#!/bin/bash
#To run this script, first type 'chmod u+x testRest.sh' to give it permissions
#then (while in the same directory) type './testReset.sh'

bundle exec rake db:migrate;
echo "db:migrate done";
bundle exec rake test:prepare;
echo "test:prepare done";
bundle exec rspec spec/
