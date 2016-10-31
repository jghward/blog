class PhotoUploader < CarrierWave::Uploader::Base
  logger = Logger.new(STDOUT)

  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  process :auto_orient
  #process :resize_to_fit => [200, 300]

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #

  #def scale(width, height)
  #  process :auto_orient
  #  process scale: [200, 300]
  #end

  # Create different versions of your uploaded files:
  version :thumb do
    process :auto_orient
    process resize_to_fit: [150, 150]
  end

  version :display do
    process :auto_orient
    process resize_to_fit: [1200, 950]
  end

  version :albumcover, if: :now? do
    process :auto_orient
    process resize_to_fill: [200, 200]
  end

  version :collectioncover, if: :now? do
    process :auto_orient
    process resize_to_fill: [250, 250]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def auto_orient
    manipulate! do |img|
      img = img.auto_orient
    end
  end

  def now
    @now = true
    self
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

#  protected
  
  def now?(_)
    @now
  end	

end
