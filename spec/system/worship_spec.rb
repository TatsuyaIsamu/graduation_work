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
    # describe '神社の検索テスト' do
    #   context '参拝の設定画面で test 神社を検索したとき' do
    #     it  'test 神社が画面に表示される' do
    #       visit search_worships_path
    #       fill_in "q[name_or_address_cont]", with: "test神社"
    #       click_on 'button'
    #       expect(page).to have_content("test神社")
    #     end
    #   end
    # end
    # describe '神社の参拝画面から確認画面のデータの受け渡し' do
    #   before do
    #     visit new_worship_path(shinto_id: test_shinto.id)
    #   end
      # context 'worship の基本情報を入力したら' do
      #   it '確認画面で表示される' do
      #     fill_in 'worship[worship_day]', with: "2021-10-09"
      #     fill_in 'worship[memo]', with: "testMemo"
      #     choose '雨'
      #     attach_file 'inputFile', "#{Rails.root}/spec/factories/test.jpg", make_visible: true
      #     fill_in 'worship[worship_params_attributes][0][title]', with: 'paramsTitle'
      #     find(".worship_stars").find("img[alt='5']").click
      #     fill_in 'worship[worship_params_attributes][0][memo]', with: 'paramsMemo'
      #     click_on "確認画面へ"
      #     expect(page).to have_content("2021-10-09")
      #     expect(page).to have_content("testMemo")
      #     expect(page).to have_content("雨")
      #     expect(page).to have_selector("img[src$='test.jpg']")
      #     expect(page).to have_content("paramsTitle")
      #     expect(page).to have_content("paramsMemo")
      #     expect(all("input", visible: false)[1].value).to eq "4.5"
      #   end
      # end
      # context 'パラメータを追加してフォームに情報を記載したとき' do
      #   it  '情報が確認画面で表示される' do
      #     fill_in 'worship[worship_day]', with: "2021-10-09"
      #     find('.add_fields').click
      #     page.all(".worship_stars")[0].find("img[alt='1']").click
      #     page.all(".worship_stars")[1].find("img[alt='5']").click
      #     sleep 0.5
      #     click_on "確認画面へ"
      #     expect(all("input", visible: false)[1].value).to eq "0.5"
      #     expect(all("input", visible: false)[2].value).to eq "4.5"
      #   end
      # end
      # context 'パラメータを削除してから追加したフォームに情報を記載したとき' do
      #   it  '情報が確認画面で表示される' do
      #     fill_in 'worship[worship_day]', with: "2021-10-09"
      #     page.all(".remove_fields")[0].click
      #     find('.add_fields').click
      #     page.all(".worship_stars")[0].find("img[alt='1']").click
      #     sleep 0.5
      #     click_on "確認画面へ"
      #     expect(all("input", visible: false)[1].value).to eq "0.5"
      #   end
      # end
      # context '参拝日の記載を忘れて確認画面に遷移しようとしたとき' do
      #   it  'バリデーションに引っかかり、値はフォームに初期値がはいる' do
      #     fill_in 'worship[memo]', with: "testMemo"
      #     choose '雨'
      #     attach_file 'inputFile', "#{Rails.root}/spec/factories/test.jpg", make_visible: true
      #     fill_in 'worship[worship_params_attributes][0][title]', with: 'paramsTitle'
      #     fill_in 'worship[worship_params_attributes][0][memo]', with: 'paramsMemo'
      #     click_on "確認画面へ"
      #     expect(page).to have_content("参拝日を入力して下さい")
      #     expect(page).to have_content("testMemo")
      #     expect(page).to have_content("雨")
      #     expect(page).to have_selector("img[src$='test.jpg']")
      #   end
      # end
      # context '情報を記載して確認画面に遷移したあと' do
      #   it '再び入力画面に戻ったときデータが保持されている' do
      #     fill_in 'worship[worship_day]', with: "2021-10-09"
      #     fill_in 'worship[memo]', with: "testMemo"
      #     choose '雨'
      #     attach_file 'inputFile', "#{Rails.root}/spec/factories/test.jpg", make_visible: true
      #     click_on "確認画面へ"
      #     click_on "参拝情報入力画面に戻る"
      #     expect(find('.datepicker').value).to eq("2021-10-09")
      #     expect(page).to have_content("testMemo")
      #     expect(page).to have_checked_field('雨')
      #     expect(page).to have_selector("img[src$='test.jpg']")
      #   end
      # end
      # describe '画像のプレビュー機能' do
      #   context '画像をセットしたとき' do
      #     it '画像が非同期で画面に反映される' do
      #       attach_file 'inputFile', "#{Rails.root}/spec/factories/test.jpg", make_visible: true
      #       expect(find(".custom-file-label").text).to eq("test.jpg")
      #     end
      #   end
      #   context '画像の取消ボタンを押したとき' do
      #     it '画像が削除される' do
      #       attach_file 'inputFile', "#{Rails.root}/spec/factories/test.jpg", make_visible: true
      #       click_on "inputFileReset"
      #       expect(find(".custom-file-label").text).not_to eq("test.jpg")
      #     end
      #   end
      # end
    # end
    # describe  '御朱印の作成機能' do
    #   before do
    #     visit new_worship_path(shinto_id: test_shinto.id)
    #     fill_in 'worship[worship_day]', with: "2021-10-09"
    #     click_on "確認画面へ"
    #     click_on "御朱印をもらう"
    #   end
      # context '御朱印申請をしたとき' do
      #   it  '申請した神社名と日付が表示される' do
      #     sleep 1
      #     expect(page).to have_content('ようこそお参りいただきました')
      #     expect(page).to have_content('test神社')
      #     expect(page).to have_content('二〇二一年一〇月〇九日')
      #   end
      # end
      # context 'もらった御朱印が' do
      #   it  '御朱印帳に反映される' do
      #     click_on "御朱印帳をみる"
      #     binding.irb
      #     expect( page.all('.gosyuin_book_day')[0].text).to eq ('test神社')
      #     expect( page.all('.gosyuin_book_day')[1].text).to eq ('二〇二一年一〇月〇九日')
      #   end
      # end
    # end
    describe  '参拝記録の確認' do
      before do
        create(:worship, worship_day: Date.today.beginning_of_month, user_id: user_introduction.user_id, shinto_id: test_shinto.id)
        create(:worship, worship_day: Date.today.months_ago(1).to_date.beginning_of_month, user_id: user_introduction.user_id, shinto_id: test_shinto.id)
        create(:worship, worship_day: Date.today.months_ago(2).to_date.beginning_of_month, user_id: user_introduction.user_id, shinto_id: test_shinto.id)
      end
      # context '参拝した記録の詳細が' do
      #   it  '詳細画面で表示されること' do
      #     worship = create(:worship, user_id: user_introduction.user_id)
      #     create(:worship_param, worship_id: worship.id)
      #     find('.drawer-toggle').click
      #     page.all(".worship-list-group-item")[0].click
      #     page.all(".worship_card")[0].click
      #     expect(page).to have_content(Date.today)
      #     expect(page).to have_content("testMemo")
      #     expect(page).to have_content("雨")
      #     expect(page).to have_content("testParamTitle")
      #     expect(page).to have_content("testParamMemo")
      #     expect(all("input", visible: false)[0].value).to eq "1"
      #   end
      # end
      # context '参拝した記録が' do
      #   it 'TOP画面に参拝日の古いものから表示される' do
      #     visit home_path
      #     expect(page.all(".worship_card")[0]).to have_content(Date.today.beginning_of_month)
      #     expect(page.all(".worship_card")[1]).to have_content(Date.today.months_ago(1).to_date.beginning_of_month)
      #     expect(page.all(".worship_card")[2]).to have_content(Date.today.months_ago(2).to_date.beginning_of_month)
      #   end
      # end
      # context 'サイドバーの一番新しい月を選択したとき' do
      #   it '選択した月の参拝記録一覧が表示される' do
      #     visit home_path
      #     find('.drawer-toggle').click
      #     page.all(".worship-list-group-item")[0].click
      #     expect(page.all(".worship_card")[0]).to have_content(Date.today.beginning_of_month)
      #   end
      # end
      # context 'サイドバーの二番目に新しい月を選択したとき' do
      #   it '選択した月の参拝記録一覧が表示される' do
      #     visit home_path
      #     find('.drawer-toggle').click
      #     page.all(".worship-list-group-item")[1].click
      #     expect(page.all(".worship_card")[0]).to have_content(Date.today.months_ago(1).to_date.beginning_of_month)
      #   end
      # end
      # context 'サイドバーの三番目に新しい月を選択したとき' do
      #   it '選択した月の参拝記録一覧が表示される' do
      #     visit home_path
      #     find('.drawer-toggle').click
      #     page.all(".worship-list-group-item")[2].click
      #     expect(page.all(".worship_card")[0]).to have_content(Date.today.months_ago(2).to_date.beginning_of_month)
      #   end
      # end
      # context '参拝カレンダーを表示したとき' do
      #   it  '今月参拝した神社名がカレンダーに表示される' do
      #     visit home_path
      #     find('.drawer-toggle').click
      #     find(".worship_calendar").click
      #     expect(page).to have_content("test神社")
      #   end
      # end
      # context '参拝カレンダーに表示されている神社を入力したとき' do
      #   it  '参拝情報が表示される' do
      #     visit home_path
      #     find('.drawer-toggle').click
      #     find(".worship_calendar").click
      #     click_on 'test神社'
      #     expect(page).to have_content(Date.today.beginning_of_month)
      #     expect(page).to have_content("testMemo")
      #     expect(page).to have_content("雨")
      #   end
      # end
      # describe  '御朱印帳機能' do
      #   context '参拝した神社名と参拝日時が' do
      #     it  '御朱印帳に記載される' do
      #       visit home_path
      #       find('.nav-item4').click
      #       worship1 = Worship.first
      #       worship2 = Worship.second
      #       worship3 = Worship.third
      #       sleep 1.0
      #       expect(page).to have_content(worship1.shinto.name)
      #       expect(page).to have_content(worship2.shinto.name)
      #       expect(page).to have_content(worship3.shinto.name)
      #       expect(find('.gosyuin_book', visible: false)).to have_selector('.gosyuin_book_day',visible: false,text: worship1.worship_day.strftime("%Y年%m月%d日").tr('0123456789', '〇一二三四五六七八九'))
      #       expect(find('.gosyuin_book', visible: false)).to have_selector('.gosyuin_book_day',visible: false,text: worship2.worship_day.strftime("%Y年%m月%d日").tr('0123456789', '〇一二三四五六七八九'))
      #       expect(find('.gosyuin_book', visible: false)).to have_selector('.gosyuin_book_day',visible: false,text: worship3.worship_day.strftime("%Y年%m月%d日").tr('0123456789', '〇一二三四五六七八九'))
      #     end
      #   end
      #   context '参拝していない神社名と参拝日時は' do
      #     it  '御朱印帳に記載されない' do
      #       visit home_path
      #       find('.nav-item4').click

      #       expect(page).not_to have_content('dammy神社')
      #       expect(find('.gosyuin_book', visible: false)).not_to have_selector('.gosyuin_book_day',visible: false,text: Date.tomorrow.strftime("%Y年%m月%d日").tr('0123456789', '〇一 二三四五六七八九'))
      #     end
      #   end
      # end
      describe  '参拝情報の編集 削除機能' do
        
      end
    end
  end
end