class DigitalOceanServer < Server
  field :access_token, type: String
  field :image, type: String

  def type
    'Digital ocean'
  end

  def manage_url
    "https://cloud.digitalocean.com/droplets/#{provider_id}"
  end

  def accessible?
    self.ip_address.present?
  end

  def provision
    AnsibleProvisioner.new(self).provision
  end

  def refresh!
    digital_ocean = DigitalOcean::Client.new(access_token: access_token)

    droplet = digital_ocean.servers.find_by_provider_id(provider_id)

    update_attributes(provider_id: droplet.id, size: droplet.memory, cpus: droplet.vcpus, disk: droplet.disk, status: droplet.status)
    update_attributes(ip_address: droplet.networks.v4.first.ip_address) if droplet.networks.v4
  end
end
