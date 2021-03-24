class AttachmentUploader < CarrierWave::Uploader::Base
  # include CarrierWaveDirect::Uploader
  # include CarrierWave::Video
  # include CarrierWave::FFmpeg
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{wordform}/#{attachment_type}/#{revision}"
  end

  # def cache_dir
  #   "#{wordform}/#{attachment_type}/#{revision}"
  # end

  # def store_path(for_file = filename)
  #   "#{wordform}/#{attachment_type}/#{revision}/#{filename}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png mp4)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  # end
  #
  private
    def wordform
      model.word.wordform.downcase
    end

    def attachment_type
      model.class.to_s.downcase.pluralize
    end

    def revision
      model.revision.to_s
    end
end
