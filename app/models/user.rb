class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :zip_code, presence:true
  validates :home_address, presence:true

  has_one :select, dependent: :destroy

  def self.search(search)
      if search
        User.where(['home_address LIKE ?', "%#{search}%"])
      else
        User.all
      end
    end

end
