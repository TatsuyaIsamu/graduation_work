class RemoveShintoParamsFromShintoParamItems < ActiveRecord::Migration[5.2]
  def change
    drop_table :shinto_param_items
  end
end
