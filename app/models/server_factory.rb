class ServerFactory
  def self.create_server(params)
    DigitalOceanServer.new(params)
  end
end