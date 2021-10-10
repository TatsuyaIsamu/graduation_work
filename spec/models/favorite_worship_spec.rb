RSpec.describe FavoriteWorship, type: :model do
  describe 'FavoriteWorshipモデル' do
    it 'インスタンスが作成できる' do
      expect(create(:favorite_worship)).to be_valid
    end
  end
end
