key = SSHKey.new(Rails.root.join('config', 'keys', 'id_rsa').read)

Rails.application.config.key_fingerprint = key.md5_fingerprint