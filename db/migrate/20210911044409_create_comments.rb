class CreateComments < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :comments, :users
    remove_reference :comments, :user, index: true
    remove_foreign_key :comments, :shintos
    remove_reference :comments, :shinto, index: true
    drop_table :comments
  end
  # def change
  #   create_table :comments do |t|
  #     t.text :comment
  #     t.references :worship, foreign_key: true
  #     t.references :user, foreign_key: true

  #     t.timestamps
  #   end
  # end
end
