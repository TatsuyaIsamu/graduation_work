module LogoutAndOtherUserLoginModule
  def logout_and_other_user_login
    visit home_path
    click_on find(".nav-item5").text
    other = create(:other_user)
    create(:user_introduction, user_id: other.id)
    login(other)
  end
end