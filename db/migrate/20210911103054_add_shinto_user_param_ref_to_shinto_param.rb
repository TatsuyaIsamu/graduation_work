class AddShintoUserParamRefToShintoParam < ActiveRecord::Migration[5.2]
  def change
    add_reference :shinto_params, :shinto_user_param, foreign_key: true
  end
end
