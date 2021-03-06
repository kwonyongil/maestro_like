CarrierWave.configure do |config| 
    config.fog_provider = 'fog/aws' # required
    config.fog_credentials = { provider: 'AWS', # required
    aws_access_key_id: ENV["aws_access_key"], # required 
    aws_secret_access_key: ENV["aws_secret_access"], # required
    region: 'ap-northeast-2', # optional, defaults to 'us-east-1' 
    } 
    config.fog_directory = 'kwonyongil'  # required
end