RSpec.describe FavoriteShinto, type: :model do
  describe 'FavoriteShintoモデル' do
    it 'インスタンスが作成できる' do
      expect(create(:favorite_shinto)).to be_valid
    end
  end
end
