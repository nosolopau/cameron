module DigitalOcean

  class ServersClient < ResourcesClient

    def find_by_provider_id(provider_id)
      barge.droplet.show(provider_id).droplet
    end

    def create(params)
      new_server = barge.droplet.create(params)
      raise 'Cannot create server' unless new_server.success?
      new_server.droplet
    end
  end
end