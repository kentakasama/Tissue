class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :zip_code, presence:true
  validates :home_address, presence:true

  has_many :selects, dependent: :destroy
  has_one :order

  def self.search(search)
      if search
        User.where(['email LIKE ?', "%#{search}%"])
      else
        User.all
      end
    end

end
