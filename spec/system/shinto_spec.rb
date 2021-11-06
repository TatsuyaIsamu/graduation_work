RSpec.describe Shinto, type: :system do
  describe '神社の検索機能' do
    let(:user) { create(:user) }
    let(:shinto) { create(:test_shinto) }
    before do
      create(:user_introduction, user_id: user.id)
      shinto
      login(user)
    end
    context '神社名を検索したとき' do
      it '神社が検索結果に表示される' do
        visit shintos_path
        fill_in 'q[name_or_address_or_kamisama_cont]', with: 'test神社'
        click_on 'button'
        expect(page).to have_content('test神社')
      end
    end
    context '存在しない神社名検索ををしたとき' do
      it '神社の検索結果に何も表示されない' do
        visit shintos_path
        fill_in 'q[name_or_address_or_kamisama_cont]', with: 'nonage'
        click_on 'button'
        expect(page).not_to have_content('noname')
      end
    end
    context '神社の住所を検索したとき' do
      it '神社が検索結果に表示される' do
        visit shintos_path
        fill_in 'q[name_or_address_or_kamisama_cont]', with: '（〒114-0022）東京都北区岸町1-12-26'
        click_on 'button'
        expect(page).to have_content('test神社')
      end
    end
    context '神社詳細画面から参拝画面への遷移' do
      context '神社詳細画面のこの神社のご朱印をもらうボタンをおしたとき' do
        it 'その神社が表示される' do
          visit shinto_path(shinto.id)
          click_on 'この神社の御朱印を申請する'
          expect(page).to have_content 'test神社'
        end
      end
    end
  end
end
