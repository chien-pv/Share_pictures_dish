class Dish < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  belongs_to :food
  belongs_to :category
  has_many :commends
  has_many :dishs_day
  has_many :days, through: :dishs_day
  belongs_to :user

  validates :name,:desc,:processing, presence: true
  # validates :desc, inclusion: { in: %w(small medium large), message: "%{value} is not a valid size" }, allow_nil: true
  # validates :name, length: { is: 5, message: "%{value} is not a valid size"  }, allow_blank: true
  def self.list_foods
    Food.all
  end
  def self.list_categories
    Category.all
  end
end
