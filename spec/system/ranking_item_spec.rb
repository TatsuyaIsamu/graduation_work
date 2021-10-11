RSpec.describe RankingItem, type: :system do
  describe  '神社ランキング機能' do
    let(:user_introduction) {create(:user_introduction)}
    before do
      user_introduction
      login(user_introduction.user)
      build_user_ranking(user_introduction.user)
      create(:shinto)
    end
    context '１位の神社を更新したとき' do
      it  '１位の神社が更新される' do
        visit user_introduction_path(user_introduction.user_id)
        find('.rspec_edit_ranking1').click
        fill_in 'q[name_cont]', with: '王子神社'
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
        fill_in 'q[name_cont]', with: '王子神社'
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
        fill_in 'q[name_cont]', with: '王子神社'
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
          
        end
      end
    end
  end
end