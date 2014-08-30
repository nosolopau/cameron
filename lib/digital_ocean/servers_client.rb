module DigitalOcean

  class ServersClient < Resource

    def find_by_provider_id(provider_id)
      server = barge.droplet.show(provider_id).droplet

      #self.update_attributes(ip_address: .droplet.networks.v4.first.ip_address)

      if params[:fingerprint].present?
        key = barge.key.show(params[:fingerprint])
        key if key.success?
      end
    end

    def create(params)
      barge.droplet.create(params, ).droplet
    end
  end
end