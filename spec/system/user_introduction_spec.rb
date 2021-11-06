RSpec.describe UserIntroduction, type: :system do
  describe 'ユーザープロフィールの編集機能' do
    let(:user_introduction) { create(:user_introduction) }
    before do
      user_introduction
      login(user_introduction.user)
      build_user_ranking(user_introduction.user)
    end
    context 'ユーザーが住所を青森県に変更したとき' do
      it '変更できる' do
        visit edit_user_introduction_path(user_introduction.user_id)
        select '青森', from: 'user_introduction[address]'
        click_on '保存する'
        expect(page).to have_content('青森県')
      end
    end
    context 'ユーザーが自己紹介を変更したとき' do
      it '変更できる' do
        visit edit_user_introduction_path(user_introduction.user_id)
        fill_in 'user_introduction[introduction]', with: '変更しました'
        click_on '保存する'
        expect(page).to have_content('変更しました')
      end
    end
    context 'ユーザーがプロフィール画像を変更したとき' do
      it '変更できる' do
        visit edit_user_introduction_path(user_introduction.user_id)
        attach_file 'inputFile', "#{Rails.root}/spec/factories/test.jpg", make_visible: true
        click_on '保存する'
        expect(page).to have_selector("img[src$='test.jpg']")
      end
    end
    context 'ユーザーが編集画面に遷移したとき' do
      it 'ユーザー情報が初期値として入力されている' do
        visit edit_user_introduction_path(user_introduction.user_id)
        expect(page).to have_content('testText')
        expect(page).to have_content('北海道')
      end
    end
    context '編集画面の Back を押したとき' do
      it 'そのユーザーのプロフィール画面に遷移する' do
        visit edit_user_introduction_path(user_introduction.user_id)
        click_on 'Back'
        expect(page).to have_content('基本プロフィール')
        expect(page).to have_content('testuser')
      end
    end
    context '違うユーザーがユーザープロフィール画面を見たとき' do
      it '編集ボタンが表示されない' do
        logout_and_other_user_login
        visit user_introduction_path(user_introduction.user_id)
        expect(page).to have_no_css('.self_edit')
      end
    end
    context '違うユーザーがユーザープロフィールを編集しようとしたとき' do
      it 'ホーム画面にリダイレクトされる' do
        logout_and_other_user_login
        visit edit_user_introduction_path(user_introduction.user_id)
        expect(page).to have_content('アクセスできません')
      end
    end
  end
end
