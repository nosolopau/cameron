module DigitalOcean

  class ResourcesClient
    attr_accessor :barge

    def initialize(barge)
      self.barge = barge
    end
  end
end