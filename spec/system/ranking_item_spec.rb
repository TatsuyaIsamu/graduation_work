RSpec.describe RankingItem, type: :system do
  describe  '神社ランキング機能' do
    let(:user_introduction) {create(:user_introduction)}
    before do
      user_introduction
      login(user_introduction.user)
      ranking1 = create(:ranking, user_id: user_introduction.user_id, rank: 1)
      create(:ranking_item, ranking_id: ranking1.id)
      ranking2 = create(:ranking, user_id: user_introduction.user_id, rank: 2)
      create(:ranking_item, ranking_id: ranking2.id)
      ranking3 = create(:ranking, user_id: user_introduction.user_id, rank: 3)
      create(:ranking_item, ranking_id: ranking3.id)
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
  end
end