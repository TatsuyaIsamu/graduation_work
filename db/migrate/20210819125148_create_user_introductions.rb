class CreateUserIntroductions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_introductions do |t|
      t.integer :address
      t.string :image
      t.text :introduction
      
      t.timestamps
    end
  end
end
