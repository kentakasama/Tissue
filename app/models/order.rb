class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :select

  validates :delivery_zip_code, presence:true
  validates :delivery_home_address, presence:true
end
