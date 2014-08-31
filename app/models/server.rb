class Server
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :roles
  has_many :provisionings
  belongs_to :user

  field :name, type: String
  field :provider_id, type: String
  field :ip_address, type: String
  field :region, type: String
  field :cpus, type: Integer
  field :disk, type: Integer
  field :status, type: String
  field :size, type: String

  def system_id
    "srv_#{id}"
  end

  def user
    'root'
  end

  def type
  end

  def manage_url
  end

  def accessible?
  end

  def refresh!
  end

  def provision
  end
  handle_asynchronously :provision

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
