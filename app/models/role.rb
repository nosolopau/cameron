class Role
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :servers

  field :name, type: String
end
