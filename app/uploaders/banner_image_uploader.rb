# encoding: utf-8
class BannerImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

  storage :file

  def store_dir
    "system/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :banner do
    process :resize_to_fill => [607, 351]
  end

  version :thumb do
    process :resize_to_fill => [260, 164]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
