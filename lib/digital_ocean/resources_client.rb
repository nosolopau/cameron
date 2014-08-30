module DigitalOcean
  class Resource
    attr_accessor :barge

    def initialize(barge)
      self.barge = barge
    end
  end
end