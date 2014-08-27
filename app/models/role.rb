class Role
  include Mongoid::Document

  has_and_belongs_to_many :servers

  field :name, type: String
end
