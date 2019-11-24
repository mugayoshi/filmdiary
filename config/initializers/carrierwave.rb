require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: S3_info::ACCESS_KEY, # stored in s3_info.rb
      aws_secret_access_key: S3_info::SECRET_ACCESS_KEY, # stored in s3_info.rb
      region: 'ap-northeast-1'  # this means regionTokyo
    }
    config.fog_directory  = 'film-diary-bucket' # bucket name
  end
  # setting for japanese file name
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end