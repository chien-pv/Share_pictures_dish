class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :dishs
  has_many :comments
  belongs_to :role

  def self.xu_ly_edit(params)
    # binding.pry
    if User.find_by_id(params[:id])
      User.find_by_id(params[:id]).update(name: params[:name], email: params[:email],role_id: params[:role_id])
    end
  end
    def self.Them(params)
    # binding.pry
      User.new(name: params[:name], email: params[:email],role_id: params[:role_id],password: params[:password] )
  end
end
