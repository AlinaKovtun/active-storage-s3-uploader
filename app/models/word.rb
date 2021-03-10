class Word < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :audios, dependent: :destroy
end
