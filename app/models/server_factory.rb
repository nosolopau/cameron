class ServerFactory
  def self.create_server(params, access_token)
    digital_ocean = DigitalOcean::Client.new(access_token: access_token)

    # Add keys to account
    digital_ocean.keys.create(name: 'Cameron', public_key: public_key) unless digital_ocean.keys.find_by_fingerprint(key_fingerprint)

    # Create server with keys
    digital_ocean_server = digital_ocean.servers.create(params.merge(size: '512mb', image: '5588928', ssh_keys: [key_fingerprint]))
    if digital_ocean_server
      server = DigitalOceanServer.new(params.merge(access_token: access_token, provider_id: digital_ocean_server.id))
      server.refresh!
      server
    end
  end

  def self.key_fingerprint
    Rails.application.config.key_fingerprint
  end

  def self.public_key
    File.read('config/keys/id_rsa.pub')
  end
end