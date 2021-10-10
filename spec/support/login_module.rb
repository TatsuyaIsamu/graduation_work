module LoginModule
  def user_login
    visit new_user_session_path
    fill_in "user[email]", with: "test@gmail"
    fill_in "user[password]", with: "111111"
    click_on 'ログイン'
  end
end


