class DigitalOceanServer < Server
  field :provider_access_token, type: String

  def type
    'Digital ocean'
  end

  def manage_url
    "https://cloud.digitalocean.com/droplets/#{provider_id}"
  end

  def active?
    self.ip_address.present?
  end

  def provision
    AnsibleProvisioner.new(self).provision
  end

  def refresh!
    barge = Barge::Client.new(access_token: self.provider_access_token)

    raise 'Network not assigned' unless barge.droplet.show(self.provider_id).droplet.networks.v4
    self.update_attributes(ip_address: barge.droplet.show(self.provider_id).droplet.networks.v4.first.ip_address)
  end
end
