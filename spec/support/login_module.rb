module LoginModule
  def login(user)
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "111111"
    click_on 'ログイン'
  end
end


