class Video < ApplicationRecord
  belongs_to :word
  mount_uploader :attachment, AttachmentUploader, validate_download: false, validate_integrity: false, validate_processing: false
end
