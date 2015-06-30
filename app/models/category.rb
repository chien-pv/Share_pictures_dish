class Category < ActiveRecord::Base
  has_many :dishs
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
