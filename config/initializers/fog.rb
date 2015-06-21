if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
  end
else
  CarrierWave.configure do |config|
     config.storage = :fog
     config.fog_credentials = {
       :provider               => 'AWS',       # required
       :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],       # required
       :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']       # required
  }
   config.fog_directory  = 'where-coffee'                     # required
  end

end
