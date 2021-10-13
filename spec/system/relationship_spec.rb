RSpec.describe Relationship, type: :system do
  describe  'フォロー機能' do
    let(:user_introduction) {create(:user_introduction)}
    let(:other_user) {create(:other_user)}
    before do
      user_introduction
      other_user
      create(:user_introduction, user_id: other_user.id)
      login(user_introduction.user)
    end
    context 'ユーザーをフォローするボタンをおしたとき' do
      it  'フォローを解除するボタンが表示される' do
        visit search_users_path
        fill_in "q[name_cont]", with: "otheruser"
        click_on 'button'
        page.all('.btn-outline-primary')[1].click
        sleep 0.5
        expect(page.all('.btn-outline-primary')[1].text).to have_content("フォローを解除")
      end
    end
    context 'ユーザーをフォローを解除するボタンをおしたとき' do
      it  'フォローをするボタンが表示される' do
        visit search_users_path
        fill_in "q[name_cont]", with: "otheruser"
        click_on 'button'
        page.all('.btn-outline-primary')[1].click
        sleep 0.5
        page.all('.btn-outline-primary')[1].click
        sleep 0.5
        expect(page.all('.btn-outline-primary')[1].text).to have_content("フォローをする")
      end
    end
    context '他のユーザーをフォローしたとき' do
      it  '友達一覧のページに表示される' do
        visit search_users_path
        fill_in "q[name_cont]", with: "otheruser"
        click_on 'button'
        page.all('.btn-outline-primary')[1].click
        sleep 0.5
        visit users_path
        expect(page).to have_content("otheruser")
      end
    end
    context 'フォローを解除したとき' do
      it  '友達一覧のページから消える' do
        visit search_users_path
        fill_in "q[name_cont]", with: "otheruser"
        click_on 'button'
        page.all('.btn-outline-primary')[1].click
        sleep 0.5
        visit users_path
        page.all('.btn-outline-primary')[1].click
        sleep 0.5
        visit users_path
        expect(page).not_to have_content("otheruser")
      end
    end
  end
end