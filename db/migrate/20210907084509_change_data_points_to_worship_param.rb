class ChangeDataPointsToWorshipParam < ActiveRecord::Migration[5.2]
  def change
    change_column :worship_params, :points, :float
  end
end
