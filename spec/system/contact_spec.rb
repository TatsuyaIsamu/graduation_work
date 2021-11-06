RSpec.describe Contact, type: :system do
  describe 'お問い合わせ' do
    let(:user_introduction) { create(:user_introduction) }
    before do
      user_introduction
      login(user_introduction.user)
      visit new_contact_path
    end
    context 'お問い合わせ内容を送信したとき' do
      it '確認ページにお問い合わせをした内容が表示される' do
        fill_in 'contact[name]', with: 'テストタイトル'
        fill_in 'contact[email]', with: 'test@gmail.com'
        fill_in 'contact[content]', with: 'テスト内容'
        click_on '送信する'
        expect(page).to have_content('テストタイトル')
        expect(page).to have_content('test@gmail.com')
        expect(page).to have_content('テスト内容')
      end
    end
    describe  'バリデーション機能' do
      context 'emailを空で送信しようとしたとき' do
        it 'エラーメッセージが表示される' do
          fill_in 'contact[name]', with: 'test'
          fill_in 'contact[content]', with: 'test'
          click_on '送信する'
          expect(page).to have_content('Emailアドレスを入力して下さい')
        end
      end
      context '不正なemailアドレスで送信しようとしたとき' do
        it 'エラーメッセージが表示される' do
          fill_in 'contact[name]', with: 'test'
          fill_in 'contact[content]', with: 'test'
          fill_in 'contact[email]', with: 'test'
          click_on '送信する'
          expect(page).to have_content('Emailアドレスが不正です')
        end
      end
      context '名前を空で送信しようとしたとき' do
        it 'エラーメッセージが表示される' do
          fill_in 'contact[email]', with: 'test'
          fill_in 'contact[content]', with: 'test'
          click_on '送信する'
          expect(page).to have_content('名前を入力して下さい')
        end
      end
      context '内容を空で送信しようとしたとき' do
        it 'エラーメッセージが表示される' do
          fill_in 'contact[name]', with: 'test'
          fill_in 'contact[email]', with: 'test'
          click_on '送信する'
          expect(page).to have_content('内容を入力して下さい')
        end
      end
    end
  end
end
