class ServerFactory
  def self.create_server(params, api_key)
    fingerprint = Rails.application.config.key_fingerprint
    barge = Barge::Client.new(access_token: api_key)

    # Search server rsa key in the account and create it if not found:
    barge.key.create(name: 'Cameron', public_key: `cat id_rsa.pub`) unless barge.key.show(fingerprint).success?

    # Create droplet
    # new_droplet = barge.droplet.create(name: params[:name], size: '512mb', image: '5588928', region: params[:region], ssh_keys: [fingerprint]).droplet
    new_droplet = nil
    new_server = DigitalOceanServer.new(params)
    new_server.update_attributes(provider_id: new_droplet.id, memory: new_droplet.memory, cpus: new_droplet.vcpus, disk: new_droplet.vcpus, status: new_droplet.status) if new_droplet

    new_server
  end
end