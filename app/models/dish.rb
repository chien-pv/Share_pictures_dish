class Dish < ActiveRecord::Base

  mount_uploader :image, PictureUploader
  belongs_to :food
  belongs_to :category
  has_many :commends
  has_many :dishs_days
   has_many :likes
  has_many :days, through: :dishs_day
  belongs_to :user

  validates :name,:desc,:processing, presence: true
  # validates :desc, inclusion: { in: %w(small medium large), message: "%{value} is not a valid size" }, allow_nil: true
  # validates :name, length: { is: 5, message: "%{value} is not a valid size"  }, allow_blank: true
  def self.list_foods
    Food.all
  end
  def self.top
    # binding.pry
    select('*' )
    joins(:likes).
    group('id').
    order('COUNT(likes.dish_id) DESC').
    limit(8)
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
    i=0
    while !(buatrua & buatoi).empty?||buatrua.empty?||buatoi.empty?&&(i<=10)
    mon1= @trua[Random.rand(@trua.length)]
    mon2= @trua[Random.rand(@trua.length)]
    mon3= @trua[Random.rand(@trua.length)]
    j=0
    while (mon1==mon2||mon2==mon3||mon3==mon1)&&(j<=10)
    mon1= @trua[Random.rand(@trua.length)]
    mon2= @trua[Random.rand(@trua.length)]
    mon3= @trua[Random.rand(@trua.length)]
    j=j+1
    end
    buatrua=[mon1,mon2,mon3]
   
    mon4= @toi[Random.rand(@toi.length)]
    mon5= @toi[Random.rand(@toi.length)]
    mon6= @toi[Random.rand(@toi.length)]
    k=0
    while (mon4==mon5||mon5==mon6||mon4==mon6)&&(k<=10)
    mon4= @toi[Random.rand(@toi.length)]
    mon5= @toi[Random.rand(@toi.length)]
    mon6= @toi[Random.rand(@toi.length)]
    k=k+1
    end
    buatoi=[mon4,mon5,mon6]
    i=i+1
     end
    thucdon=Hash.new 
    thucdon={ :sang => buasang,:trua => buatrua,:toi => buatoi }
    # binding.pry
    return thucdon 
  end
  
end
