class Server
  include Mongoid::Document

  has_and_belongs_to_many :roles

  field :provider_id, type: String
  field :ip_address, type: String
  field :region, type: String

  # This is needed to allow properly routing with inheritance :(
  def self.inherited(child)
    child.instance_eval do
      def model_name
        Server.model_name
      end
    end
    super
  end
end
