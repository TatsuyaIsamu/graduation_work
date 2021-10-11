RSpec.describe User, type: :system do
  describe '認証機能' do
    context "ユーザー登録したときに" do
      it "ホームに遷移すること" do
        visit new_user_registration_path
        fill_in "user[name]", with: "name"
        fill_in "user[email]", with: "test@com"
        fill_in "user[password]", with: "password"
        click_on "アカウント登録"
        expect(page).to have_content "アカウント登録が完了しました"
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
        expect(page).to have_content "ログインしました"
      end
    end
    context "ログインしているユーザーが" do
      it "ログアウトしたらログアウトできる" do
        
        login(create(:user_introduction).user)
        click_on find(".nav-item5").text
        expect(page).to have_content "ログアウトしました"
      end
    end
    context "ログインしているユーザーが" do
      it "退会ボタンを押すことで退会される" do
        
        login(create(:user_introduction).user)
        find("#dropdownMenuButton").click
        page.accept_confirm do
          click_on page.all(".dropdown-item")[3].text 
        end
        sleep 1
        expect(User.first).to eq nil 
      end
    end
    describe 'forbid_login_user メソッド' do
      context 'ログインしているユーザーが TOP ページにアクセスしたとき' do
        it  'ホーム画面にリダイレクトされる' do
          login(create(:user_introduction).user)
          visit root_path
          expect(page).to have_content("新しい投稿")
        end
      end
      context 'ログインしているユーザーが signup ページにアクセスしたとき' do
        it  'ホーム画面にリダイレクトされる' do
          login(create(:user_introduction).user)
          visit new_user_registration_path
          expect(page).to have_content("ログインしています")
        end
      end
      context 'ログインしているユーザーが signin ページにアクセスしたとき' do
        it  'ホーム画面にリダイレクトされる' do
          login(create(:user_introduction).user)
          visit new_user_session_path
          expect(page).to have_content("ログインしています")
        end
      end
    end
    
  end
end