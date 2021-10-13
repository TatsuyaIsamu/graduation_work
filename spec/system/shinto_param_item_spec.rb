RSpec.describe ShintoParamItem, type: :system do
  describe "神社レビュー機能" do
    let(:user){create(:user)}
    let(:user_introduction) {create(:user_introduction, user_id: user.id)}
    let(:test_shinto) {create(:test_shinto)}
    before do
      user_introduction
      login(user_introduction.user)
      create(:test_shinto)
      visit shinto_path(test_shinto.id)
    end
    describe  '神社レビュー投稿機能 削除機能' do
      context '神社レビューを投稿したとき' do
        it  '神社レビューが更新される' do
          fill_in 'shinto_user_param[shinto_params_attributes][0][shinto_param_items_attributes][0][title]', with: "testitle"
          find(".evaluate").find("img[alt='5']").click
          fill_in 'shinto_user_param[shinto_params_attributes][0][memo]', with: "testmemo"
          click_on  'レビューを投稿する'
          expect(page).to have_content("レビューを投稿しました")
          expect(page).to have_content("testitle")
          expect(page).to have_content("testmemo")
          expect(all("input", visible: false)[7].value).to eq "4.5"
        end
      end
      context 'パラメーターを追加してそれを投稿したとき' do
        it  'レビューに投稿される' do
          click_on  'パラメーターを追加する'
          page.all("input")[0].set("title1")
          page.all("input")[1].set("title2")
          page.all(".evaluate")[0].find("img[alt='1']").click
          page.all(".evaluate")[1].find("img[alt='5']").click
          click_on  'レビューを投稿する'
          expect(page).to have_content("レビューを投稿しました")
          expect(page).to have_content("title1")
          expect(page).to have_content("title2")
          expect(all("input", visible: false)[7].value).to eq "0.5"
          expect(all("input", visible: false)[8].value).to eq "4.5"
        end
      end
      context 'パラメーターを削除して追加したフォームに情報を入力して投稿したとき' do
        it  'レビューが投稿される' do
          page.all(".remove_fields")[0].click
          click_on  'パラメーターを追加する'
          page.all("input")[0].set("title1")
          page.all(".evaluate")[0].find("img[alt='1']").click
          sleep 0.5
          click_on  'レビューを投稿する'
          expect(page).to have_content("title1")
          expect(all("input", visible: false)[7].value).to eq "0.5"
        end
      end
      context 'コメントを削除したとき' do
        it  'コメントが削除できる' do
          fill_in 'shinto_user_param[shinto_params_attributes][0][shinto_param_items_attributes][0][title]', with: "testitle"
          find(".evaluate").find("img[alt='5']").click
          fill_in 'shinto_user_param[shinto_params_attributes][0][memo]', with: "testmemo"
          click_on  'レビューを投稿する'
          page.accept_confirm do
            page.all(".fa-trash")[0].click
          end
        end
      end
      describe  '投稿の削除機能の制限' do
        context '投稿したユーザー以外のユーザーがレビューをみたとき' do
          it  '削除ボタンが表示されない' do
            fill_in 'shinto_user_param[shinto_params_attributes][0][shinto_param_items_attributes][0][title]', with: "testitle"
            find(".evaluate").find("img[alt='5']").click
            fill_in 'shinto_user_param[shinto_params_attributes][0][memo]', with: "testmemo"
            click_on  'レビューを投稿する'
            logout_and_other_user_login
            visit shinto_path(test_shinto.id)
            expect(page).to have_no_css('.fa-trash')
          end
        end
      end
    end
  end
end