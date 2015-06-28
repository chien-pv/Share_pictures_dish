class Commend < ActiveRecord::Base
  belongs_to :user
  belongs_to :dishs

end
