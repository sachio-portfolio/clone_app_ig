class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [450, 450, "Center"]

  version :thumb do
    process resize_to_fill: [280, 280, "Center"]
  end
  version :thumb50 do
    process resize_to_fill: [100, 100, "Center"]
  end
end
