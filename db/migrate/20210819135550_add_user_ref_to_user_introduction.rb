class AddUserRefToUserIntroduction < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_introductions, :user, foreign_key: true, null: false
  end
end
