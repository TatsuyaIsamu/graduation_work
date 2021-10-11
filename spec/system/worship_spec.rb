RSpec.describe Worship, type: :system do
  describe "参拝機能" do
    let(:user_introduction) {create(:user_introduction)}
    let(:test_shinto) {create(:test_shinto)}
    before do
      user_introduction
      login(user_introduction.user)
      build_user_ranking(user_introduction.user)
      create(:test_shinto)
    end
    describe '神社の検索テスト' do
      context '参拝の設定画面で test 神社を検索したとき' do
        it  'test 神社が画面に表示される' do
          visit search_worships_path
          fill_in "q[name_or_address_cont]", with: "test神社"
          click_on 'button'
          expect(page).to have_content("test神社")
        end
      end
    end
    describe '神社の参拝画面から確認画面の遷移' do
      before do
        visit new_worship_path(shinto_id: test_shinto.id)
      end
      context 'worship の基本情報を入力したら' do
        it '確認画面で表示される' do
          fill_in 'worship[worship_day]', with: "2021-10-09"
          fill_in 'worship[memo]', with: "testMemo"
          choose '雨'
          attach_file 'inputFile', "#{Rails.root}/spec/factories/test.jpg", make_visible: true
          fill_in 'worship[worship_params_attributes][0][title]', with: 'paramsTitle'
          find(".worship_stars").find("img[alt='5']").click
          fill_in 'worship[worship_params_attributes][0][memo]', with: 'paramsMemo'
          click_on "確認画面へ"
          expect(page).to have_content("2021-10-09")
          expect(page).to have_content("testMemo")
          expect(page).to have_content("雨")
          expect(page).to have_selector("img[src$='test.jpg']")
          expect(page).to have_content("paramsTitle")
          expect(page).to have_content("paramsMemo")
          expect(all("input", visible: false)[1].value).to eq "4.5"
        end
      end
      context 'パラメータを追加してフォームに情報を記載したとき' do
        it  '情報が確認画面で表示される' do
          fill_in 'worship[worship_day]', with: "2021-10-09"
          find('.add_fields').click
          page.all(".worship_stars")[0].find("img[alt='1']").click
          page.all(".worship_stars")[1].find("img[alt='5']").click
          sleep 0.5
          click_on "確認画面へ"
          expect(all("input", visible: false)[1].value).to eq "0.5"
          expect(all("input", visible: false)[2].value).to eq "4.5"
        end
      end
      context 'パラメータを削除してから追加したフォームに情報を記載したとき' do
        it  '情報が確認画面で表示される' do
          fill_in 'worship[worship_day]', with: "2021-10-09"
          page.all(".remove_fields")[0].click
          find('.add_fields').click
          page.all(".worship_stars")[0].find("img[alt='1']").click
          sleep 0.5
          click_on "確認画面へ"
          expect(all("input", visible: false)[1].value).to eq "0.5"
        end
      end
      context '参拝日の記載を忘れて確認画面に遷移しようとしたとき' do
        it  'バリデーションに引っかかり、値はフォームに初期値がはいる' do
          fill_in 'worship[memo]', with: "testMemo"
          choose '雨'
          attach_file 'inputFile', "#{Rails.root}/spec/factories/test.jpg", make_visible: true
          fill_in 'worship[worship_params_attributes][0][title]', with: 'paramsTitle'
          fill_in 'worship[worship_params_attributes][0][memo]', with: 'paramsMemo'
          click_on "確認画面へ"
          expect(page).to have_content("参拝日を入力して下さい")
          expect(page).to have_content("testMemo")
          expect(page).to have_content("雨")
          expect(page).to have_selector("img[src$='test.jpg']")

          
        end
      end
    end
  end
end