class ServerFactory
  def self.create_server(params, provider_access_token)
    fingerprint = Rails.application.config.key_fingerprint
    barge = Barge::Client.new(access_token: provider_access_token)

    # Search server rsa key in the account and create it if not found:
    barge.key.create(name: 'Cameron', public_key: `cat id_rsa.pub`) unless barge.key.show(fingerprint).success?

    # Create droplet
    new_droplet = barge.droplet.create(name: params[:name], size: '512mb', image: '5588928', region: params[:region], ssh_keys: [fingerprint]).droplet
    # new_droplet = nil

    new_server = DigitalOceanServer.new(params)
    new_server.update_attributes(provider_id: new_droplet.id, memory: new_droplet.memory, cpus: new_droplet.vcpus, disk: new_droplet.disk, status: new_droplet.status, provider_access_token: provider_access_token) if new_droplet

    new_server
  end
end