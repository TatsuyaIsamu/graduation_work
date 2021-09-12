class RemoveTitleAndPointsFromShintoParams < ActiveRecord::Migration[5.2]
  def change
    remove_column :shinto_params, :title, :string
    remove_column :shinto_params, :points, :integer
  end
end
