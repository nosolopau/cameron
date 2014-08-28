class Role
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :servers
  has_and_belongs_to_many :provisionings

  field :name, type: String
end
