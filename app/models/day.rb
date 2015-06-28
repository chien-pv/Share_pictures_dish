class Day < ActiveRecord::Base
  has_many :dishs_day
  has_many :dishs, :through => :dishs_day
end
