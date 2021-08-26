class RemoveColumnFromShinto < ActiveRecord::Migration[5.2]
  def change
    remove_column :shintos, :main_kamisama, :strings
    remove_column :shintos, :sub_kamisama1, :strings
    remove_column :shintos, :sub_kamisama2, :strings
  end
end
