# lib/active_storage/service/customized_s3_service.rb
require 'aws-sdk-s3'
require 'active_storage/service/s3_service'
require 'active_support/core_ext/numeric/bytes'

module ActiveStorage
  class Service::CustomizedS3Service < Service::S3Service
    attr_reader :client, :bucket, :root, :upload_options

    def initialize(bucket:, upload: {}, **options)
      binding.pry
      @root = options.delete(:root)
      super(bucket: bucket, upload: upload, **options)
    end

    private

    def object_for(key)

      File.join(root, key)
      bucket.object(path)
    end
  end
end