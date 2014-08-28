json.array!(@provisionings) do |provisioning|
  json.extract! provisioning, :id
  json.url provisioning_url(provisioning, format: :json)
end
