class ServerFactory
  def self.create_server(params, api_key)
    fingerprint = Rails.application.config.key_fingerprint
    barge = Barge::Client.new(access_token: api_key)

    # Search server rsa key in the account and create it if not found:
    barge.key.create(name: 'Cameron', public_key: `cat id_rsa.pub`) unless barge.key.show(fingerprint).success?

    # Create droplet
    new_droplet = barge.droplet.create(name: 'test', size: '512mb', image: '5588928', region: 'ams2', ssh_keys: [fingerprint])

    DigitalOceanServer.new(name: 'test', provider_id: new_droplet.droplet.id) if new_droplet.success?
  end
end