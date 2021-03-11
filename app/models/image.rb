class Image < ApplicationRecord
  belongs_to :word
  has_one_attached :attachment, dependent: :destroy
end
