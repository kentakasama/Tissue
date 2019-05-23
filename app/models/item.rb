class Item < ApplicationRecord
	has_many :selects, dependent: :destroy
	attachment :image
end
