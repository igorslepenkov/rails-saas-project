CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'
  config.fog_credentials = {
      provider: 'Google',
      google_project: ENV["GOOGLE_CLOUD_PROJECT"],
      google_json_key_location: ENV["GOOGLE_CLOUD_KEY_FILE"]
      # can optionally use google_json_key_location if using an actual file;
  }
  config.fog_directory = ENV["GOOGLE_CLOUD_BUCKET"]
end