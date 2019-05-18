class AddCheckBoxToSelect < ActiveRecord::Migration[5.2]
  def change
    add_column :selects, :check_box, :boolean
  end
end
