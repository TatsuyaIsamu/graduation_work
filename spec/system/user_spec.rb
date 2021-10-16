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
          expect(page).to have_content("みんなの投稿一覧")
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
    describe  'ゲストログイン機能' do
      context 'ゲストログインボタンをおしたとき' do
        it  'ログインできる' do
          visit root_path
          click_on "ゲストログイン"
          expect(page).to have_content("ゲストユーザーとしてログインしました。")
        end
      end
      context 'ゲストユーザーが退会しようしとしたとき' do
        it  '退会できない' do
          visit root_path
          click_on "ゲストログイン"
          find("#dropdownMenuButton").click
          page.accept_confirm do
            click_on page.all(".dropdown-item")[3].text 
          end
          expect(page).to have_content("ゲストユーザーは削除できません。")
        end
      end
    end
  end
  describe  'ユーザーの検索機能' do
    let(:user){create(:user)}
    let(:other_user){create(:other_user)}
    before do
      create(:user_introduction, user_id: user.id)
      create(:user_introduction, user_id: other_user.id)
      login(user)
    end
    context 'ユーザーの検索をしたとき' do
      it  'ユーザーの検索結果に表示される' do
        visit search_users_path
        fill_in "q[name_cont]", with: "otheruser"
        click_on 'button'
        expect(page).to have_content("otheruser")
      end
    end
    context '存在しないユーザーの検索をしたとき' do
      it  'ユーザーの検索結果に何も表示されない' do
        visit search_users_path
        fill_in "q[name_cont]", with: "noname"
        click_on 'button'
        expect(page).not_to have_content("noname")
      end
    end
  end
end