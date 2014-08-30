module DigitalOcean

  class KeysClient < ResourcesClient

    def find_by_fingerprint(fingerprint)
      key = barge.key.show(fingerprint)
      key.ssh_key if key.success?
    end

    def create(params)
      raise 'Cannot create key' unless barge.key.create(params).success?
    end
  end
end