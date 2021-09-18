class CreateShintoParamItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shinto_param_items do |t|
      t.string :title
      t.float :points
      t.references :shinto_param, foreign_key: true

      t.timestamps
    end
  end
end
