class Book < ApplicationRecord

  validates :title, presence: true
  validates :opinion, presence: true
  
  has_one_attached :image
  belongs_to :user
end
