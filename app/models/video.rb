class Video < ApplicationRecord
  belongs_to :word
  mount_uploader :attachment, AttachmentUploader
end
