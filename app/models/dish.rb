class Dish < ActiveRecord::Base

  mount_uploader :image, PictureUploader
  belongs_to :food
  belongs_to :category
  has_many :commends
  has_many :dishs_days
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
  def self.list_dish_slide
    # Dish.find([1, 3]) 
    all=Dish.all
    return all[(Random.rand(all.length))]
  end

  def self.thuc_don
  @sang=Dish.joins(:dishs_days).where("dishs_days.day_id= '1'")
  @trua=Dish.joins(:dishs_days).where("dishs_days.day_id= '2'")
  @toi=Dish.joins(:dishs_days).where("dishs_days.day_id= '4'")
  ran1= Random.rand(@sang.length)
  ran2= Random.rand(@trua.length)
  ran3= Random.rand(@toi.length)
  buasang=@sang[ran1]
  buatrua=Array.new
  buatoi=Array.new
  # binding.pry
  mon1= @trua[Random.rand(@trua.length)]
  mon2= @trua[Random.rand(@trua.length)]
  mon3= @trua[Random.rand(@trua.length)]
  while mon1==mon2||mon2==mon3||mon3==mon1
  mon1= @trua[Random.rand(@trua.length)]
  mon2= @trua[Random.rand(@trua.length)]
  mon3= @trua[Random.rand(@trua.length)]
  end
  buatrua=[mon1,mon2,mon3]
 
  mon4= @toi[Random.rand(@toi.length)]
  mon5= @toi[Random.rand(@toi.length)]
  mon6= @toi[Random.rand(@toi.length)]
  while mon4==mon5||mon5==mon6||mon4==mon6
  mon4= @toi[Random.rand(@toi.length)]
  mon5= @toi[Random.rand(@toi.length)]
  mon6= @toi[Random.rand(@toi.length)]
  end
  buatoi=[mon4,mon5,mon6]
  
  while !(buatrua & buatoi).empty?
  mon1= @trua[Random.rand(@trua.length)]
  mon2= @trua[Random.rand(@trua.length)]
  mon3= @trua[Random.rand(@trua.length)]
  while mon1==mon2||mon2==mon3||mon3==mon1
  mon1= @trua[Random.rand(@trua.length)]
  mon2= @trua[Random.rand(@trua.length)]
  mon3= @trua[Random.rand(@trua.length)]
  end
  buatrua=[mon1,mon2,mon3]
 
  mon4= @toi[Random.rand(@toi.length)]
  mon5= @toi[Random.rand(@toi.length)]
  mon6= @toi[Random.rand(@toi.length)]
  while mon4==mon5||mon5==mon6||mon4==mon6
  mon4= @toi[Random.rand(@toi.length)]
  mon5= @toi[Random.rand(@toi.length)]
  mon6= @toi[Random.rand(@toi.length)]
  end
  buatoi=[mon4,mon5,mon6]
   end
  thucdon=Hash.new 
  thucdon={ :sang => buasang,:trua => buatrua,:toi => buatoi }
  # binding.pry
  return thucdon 
  end
  
end
