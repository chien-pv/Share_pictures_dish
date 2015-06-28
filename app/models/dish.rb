class Dish < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  belongs_to :food
  belongs_to :category
  has_many :commends
  has_many :dishs_day
  has_many :days, through: :dishs_day
  belongs_to :user
end
