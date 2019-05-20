class Select < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :order
  # params[:search]がfに代入される。
  def self.search(f)
      if f
      	# selectに紐づいたItemからfを見つけ出す。
        Item.find_by(['name LIKE ?', "%#{f}%"]).selects
      else
        Select.all
      end
    end

end
