class Provisioning
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :server
end
