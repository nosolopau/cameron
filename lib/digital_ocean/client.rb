module DigitalOcean

  class Client
    attr_accessor :barge

    def initialize(params)
      self.barge = Barge::Client.new(params)
    end

    def servers
      DigitalOcean::ServersClient.new(barge)
    end

    def keys
      DigitalOcean::KeysClient.new(barge)
    end
  end
end