CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'ap-northeast-1',
      path_style:            true,
  }

  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = 'facebook-exam-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/facebook-exam-production'
    when 'development'
      config.fog_directory = '開発環境用のバケット名'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/facebook-exam-development'
  end
end
