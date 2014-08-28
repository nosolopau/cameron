class DigitalOceanServer < Server
  def type
    'Digital ocean'
  end

  def manage_url
    "https://cloud.digitalocean.com/droplets/#{provider_id}"
  end
end
