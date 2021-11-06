RSpec.describe FavoriteWorship, type: :system do
  describe '参拝のお気に入り機能' do
    let(:other_user) { create(:other_user) }
    let(:other_user_introduction) { create(:user_introduction, user_id: other_user.id) }
    let(:shinto) { create(:test_shinto) }
    let(:worship) { create(:worship, user_id: other_user_introduction.user_id, shinto_id: shinto.id) }
    before do
      worship
      login(create(:user_introduction).user)
    end
    context '参拝にいいねをしたとき' do
      it 'いいな数が1増える' do
        visit worship_path(worship.id)
        find('.lead').click
        expect(find('.lead')).to have_content('  1')
      end
    end
    context '参拝にいいねをしたとき' do
      it 'いいな数が1増える' do
        visit worship_path(worship.id)
        find('.lead').click
        find('.lead').click
        sleep 0.5
        expect(find('.lead')).to have_content('  0')
      end
    end
    context '自分の投稿にいいねをしようとおもっても' do
      it 'いいねすることができない' do
        visit home_path
        click_on find('.nav-item5').text
        login(other_user)
        visit worship_path(worship.id)
        find('.fa-thumbs-up').click
        expect(find('.worship_footer').text).to have_content('0')
      end
    end
  end
end
