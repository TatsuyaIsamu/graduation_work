RSpec.describe RankingItem, type: :system do
  describe  '神社ランキング機能' do
    let(:user_introduction) {create(:user_introduction)}
    before do
      user_introduction
      login(user_introduction.user)
      build_user_ranking(user_introduction.user)
      create(:test_shinto)
    end
    context '１位の神社を更新したとき' do
      it  '１位の神社が更新される' do
        visit user_introduction_path(user_introduction.user_id)
        find('.rspec_edit_ranking1').click
        fill_in 'q[name_cont]', with: 'test神社'
        click_on 'button'
        first('tbody tr').click
        fill_in "ranking_item[memo]", with: "テストOK"
        click_on "保存する"
        expect(page).to have_content("1位の神社を更新しました")
        expect(page).to have_content("テストOK")
      end
    end
    context '２位の神社を更新したとき' do
      it  '２位の神社が更新される' do
        visit user_introduction_path(user_introduction.user_id)
        find('.rspec_edit_ranking2').click
        fill_in 'q[name_cont]', with: 'test神社'
        click_on 'button'
        first('tbody tr').click
        fill_in "ranking_item[memo]", with: "テストOK"
        click_on "保存する"
        expect(page).to have_content("2位の神社を更新しました")
        expect(page).to have_content("テストOK")
      end
    end
    context '３位の神社を更新したとき' do
      it  '３位の神社が更新される' do
        visit user_introduction_path(user_introduction.user_id)
        find('.rspec_edit_ranking3').click
        fill_in 'q[name_cont]', with: 'test神社'
        click_on 'button'
        first('tbody tr').click
        fill_in "ranking_item[memo]", with: "テストOK"
        click_on "保存する"
        expect(page).to have_content("3位の神社を更新しました")
        expect(page).to have_content("テストOK")
      end
    end
    describe 'アクセス制限' do
      context '他のユーザーがユーザープロフィールにアクセスしたとき' do
        it  'ランキングの編集ボタンが表示されない' do
          logout_and_other_user_login
          visit user_introduction_path(user_introduction.user_id)
          expect(page).to have_no_css('.rspec_edit_ranking1')
        end
      end
      context '他のユーザーがユーザーランキングにアクセスしようとしたとき' do
        it 'ホーム画面にリダイレクトされる' do
          logout_and_other_user_login
          visit edit_ranking_ranking_item_path(user_introduction.user.rankings[0].id, user_introduction.user.rankings[0].ranking_items[0].id)
          expect(page).to have_content("アクセスできません")
        end
      end
    end
    describe '神社の検索テスト' do
      context 'ランキングの設定画面で test 神社を検索したとき' do
        it  'test 神社が画面に表示される' do
          visit edit_ranking_ranking_item_path(user_introduction.user.rankings[0].id, user_introduction.user.rankings[0].ranking_items[0].id)
          fill_in "q[name_cont]", with: "test神社"
          click_on 'button'
          expect(page).to have_content("test神社")
        end
      end
      context 'ランキングの設定画面で test 神社を検索したとき' do
        it  '王子神社は画面に表示されない' do
          visit edit_ranking_ranking_item_path(user_introduction.user.rankings[0].id, user_introduction.user.rankings[0].ranking_items[0].id)
          fill_in "q[name_cont]", with: "test神社"
          click_on 'button'
          expect(page).not_to have_content("王子神社")
        end
      end
    end
  end
end