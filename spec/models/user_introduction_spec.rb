RSpec.describe UserIntroduction, type: :model do
  describe 'UserIntroduction を作成したとき' do
    it 'インスタンスが作成できる' do
      expect(create(:user_introduction)).to be_valid
    end
  end
end
