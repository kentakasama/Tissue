class Select < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :order
  # params[:search]がfに代入される。
  def self.search(search)
      if search
      	# selectに紐づいたItemからfを見つけ出す。
        Item.find_by(['name LIKE ?', "%#{search}%"]).selects
      else
        Select.all
      end
    end

end
