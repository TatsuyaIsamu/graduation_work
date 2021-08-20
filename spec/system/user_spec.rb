require 'rails_helper'

RSpec.describe User, type: :system do
  describe '認証機能' do
    context "ユーザー登録したときに" do
      it "ホームに遷移すること" do
        visit new_user_registration_path
        fill_in "user[name]", with: "name"
        fill_in "user[email]", with: "test@com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "アカウント登録"
        expect(page).to have_content "トップ画面"
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
        user = build(:user)
        user.save
        visit new_user_session_path
        fill_in "user[email]", with: "test@gmail"
        fill_in "user[password]", with: "111111"
        click_on "commit"
        expect(page).to have_content "ログインしました"
      end
    end
    context "ログインしているユーザーが" do
      it "ログアウトしたらログアウトできる" do
        user = build(:user)
        user.save
        visit new_user_session_path
        fill_in "user[email]", with: "test@gmail"
        fill_in "user[password]", with: "111111"
        click_on "commit"
        click_on "ログアウト"
        expect(page).to have_content "ログインもしくはアカウント登録してください。"
      end
    end
  end
end