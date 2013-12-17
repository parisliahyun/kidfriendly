Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "75tfg6ipgtavj2", "GsodIzx50YOMms68"
end

OmniAuth.config.logger = Rails.logger