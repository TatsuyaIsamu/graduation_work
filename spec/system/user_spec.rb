RSpec.describe User, type: :system do
  describe '認証機能' do
    context "ユーザー登録したときに" do
      it "ホームに遷移すること" do
        visit new_user_registration_path
        fill_in "user[name]", with: "name"
        fill_in "user[email]", with: "test@com"
        fill_in "user[password]", with: "password"
        click_on "アカウント登録"
        expect(page).to have_content "新しい投稿"
      end
    end
    context "ログインしていないユーザーがトップ画面にアクセスしたとき" do
      it "ログインページにリダイレクトされる" do
        visit root_path
        expect(page).to have_content "ログイン"
      end
    end
    context "登録しているユーザーが" do
      it "ログインしたらログインができる" do
        create(:user_introduction)
        visit new_user_session_path
        fill_in "user[email]", with: "test@gmail"
        fill_in "user[password]", with: "111111"
        click_on "commit"
        expect(page).to have_content "新しい投稿"
      end
    end
    context "ログインしているユーザーが" do
      it "ログアウトしたらログアウトできる" do
        create(:user_introduction)
        visit new_user_session_path
        fill_in "user[email]", with: "test@gmail"
        fill_in "user[password]", with: "111111"
        click_on "commit"
        click_on find(".nav-item5").text
        expect(page).to have_content "オンライン上で御朱印を勝手に認定します"
      end
    end
    context "ログインしているユーザーが" do
      it "退会ボタンを押すことで退会される" do
        create(:user_introduction)
        visit new_user_session_path
        fill_in "user[email]", with: "test@gmail"
        fill_in "user[password]", with: "111111"
        click_on "commit"
        find("#dropdownMenuButton").click
        page.accept_confirm do
          click_on page.all(".dropdown-item")[3].text 
        end
        sleep 0.5
        expect(User.first).to eq nil 
      end
    end
  end
end