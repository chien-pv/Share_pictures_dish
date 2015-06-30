class Role < ActiveRecord::Base
  has_many :users
  
  def self.name_role(id)
    Role.find_by_id(id).name
  end
  def self.name_role_all
    Role.all
  end
end
