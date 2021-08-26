class AddColumnsToShintos < ActiveRecord::Migration[5.2]
  def change
    add_column :shintos, :kamisama, :text
    add_column :shintos, :image, :string
  end
end
