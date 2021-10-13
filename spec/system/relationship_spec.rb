RSpec.describe Relationship, type: :system do
  describe  '神社のお気に入り機能' do
    let(:user_introduction) {create(:user_introduction)}
    let(:shinto){create(:test_shinto)}
    before do
      user_introduction
      login(user_introduction.user)
      shinto
    end
    context '神社のお気に入りをしたとき' do
      it  '神社がお気に入りされてお気に入りを解除するボタンが表示される' do
        visit shinto_path(shinto.id)
        find('.fa-star').click
        expect(page).to have_content('解除する')
      end
    end
    context '解除するボタンをおしたとき' do
      it  'お気にいりが解除される' do
        visit shinto_path(shinto.id)
        find('.fa-star').click
        find('.fa-star').click
        expect(page).to have_content('お気に入りをする')
      end
    end
    context 'お気に入りした神社が' do
      it 'Myjinja の画面に表示される' do
        visit shinto_path(shinto.id)
        find('.fa-star').click
        sleep 0.5
        visit favorite_shintos_path
        expect(page).to have_content('test神社')
      end
    end
    context 'お気に入りを解除した神社は' do
      it 'Myjinja の画面に表示されない' do
        visit shinto_path(shinto.id)
        find('.fa-star').click
        find('.fa-star').click
        sleep 0.5
        visit favorite_shintos_path
        expect(page).not_to have_content('test神社')
      end
    end
  end
end