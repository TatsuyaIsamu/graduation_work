RSpec.describe Relationship, type: :model do
  describe 'RelationShip モデル' do
    it 'Relationshipモデルからインスタンスを作成できる' do
      expect(create(:relationship)).to be_valid
    end
  end
end
