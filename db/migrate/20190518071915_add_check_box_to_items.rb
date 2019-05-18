class AddCheckBoxToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :check_box, :boolean
  end
end
