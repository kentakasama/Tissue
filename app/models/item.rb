class Item < ApplicationRecord
	has_many :selects, dependent: :destroy
	has_many :orders, dependent: :destroy
	attachment :image
end
