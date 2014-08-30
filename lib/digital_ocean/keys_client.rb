module DigitalOcean

  class Key < Resource

    def find_by(params)
      if params[:fingerprint].present?
        key = barge.key.show(params[:fingerprint])
        key if key.success?
      end
    end

    def create(params)
      params[:public_key] = `cat #{params[:public_key_file]}` if params[:public_key_file]

      barge.key.create(params)
    end
  end
end