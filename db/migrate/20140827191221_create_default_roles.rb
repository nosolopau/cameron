class CreateDefaultRoles < Mongoid::Migration
  def self.up
    Role.find_or_create_by(name: 'mysql-server')
  end

  def self.down
  end
end