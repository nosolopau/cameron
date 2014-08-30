Cameron
=======

## Setup

1. Generate a SSH key-pair.
2. Place the private and the public key in the `config/keys` folder. The keys are expected to be named `id_rsa` and `id_rsa.pub`.
3. Create indexes:

    bundle exec rails runner 'Delayed::Backend::Mongoid::Job.create_indexes'