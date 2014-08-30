module DigitalOcean

  class ServersClient < ResourcesClient

    def find_by_provider_id(provider_id)
      barge.droplet.show(provider_id).droplet
    end

    def create(params)
      barge.droplet.create(params).droplet
    end
  end
end