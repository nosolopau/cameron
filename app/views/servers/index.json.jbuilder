json.array!(@servers) do |server|
  json.extract! server, :id, :provider_id, :ip_address, :region
  json.url server_url(server, format: :json)
end
