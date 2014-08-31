Cameron
=======

[![Code Climate](https://codeclimate.com/github/nosolopau/cameron/badges/gpa.svg)](https://codeclimate.com/github/nosolopau/cameron)
[![Dependency Status](https://gemnasium.com/nosolopau/cameron.svg)](https://gemnasium.com/nosolopau/cameron)

## Setup

1. Generate a SSH key-pair.
2. Place the private and the public key in the `config/keys` folder. The keys are expected to be named `id_rsa` and `id_rsa.pub`.
3. Run `bundle install`.
4. Create indexes:

        bundle exec rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'
        
## Running

You can use `Foreman` to run this application (there is a `Procfile` for development placed in the root directory):

        bundle exec foreman start
        
## Notes

The server should have the following .ssh configuration (`~/.ssh/config`):

        Host *
            StrictHostKeyChecking no
            
I know that it's terrible, but is enough for me at this moment :). Perhaps the solution described in http://serverfault.com/a/316100 will be better.