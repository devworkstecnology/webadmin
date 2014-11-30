CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAJSMFPCGZB6C2CXQQ",
    aws_secret_access_key: "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"
  }
  config.fog_directory = "devworksadmin"
end

if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end
