class Server
  include Mongoid::Document
  field :provider_id, type: String
  field :ip_address, type: String
  field :region, type: String
end
