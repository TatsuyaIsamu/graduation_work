class CreateShintoUserParams < ActiveRecord::Migration[5.2]
  def change
    create_table :shinto_user_params do |t|
      t.references :user, foreign_key: true
      t.references :shinto, foreign_key: true

      t.timestamps
    end
  end
end
