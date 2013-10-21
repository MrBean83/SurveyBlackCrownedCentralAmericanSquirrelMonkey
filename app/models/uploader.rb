class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :resize_to_fill => [200, 200]

  version :icon do
    process :resize_to_fill => [30, 30]
  end

  storage :file

end