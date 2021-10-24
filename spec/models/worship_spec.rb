RSpec.describe Worship, type: :model do
  describe '参拝機能' do
    it '参拝インスタンスを作成できる' do
      expect(create(:worship)).to be_valid
    end
    it '参拝が今日のインスタンスを作成できる' do
      expect(create(:worship, worship_day: Date.today)).to be_valid
    end
    context '参拝日が空のインスタンスを作成しようとしたとき' do
      it 'バリデーションにかかる' do
        worship = create(:worship)
        worship.worship_day = nil
        expect(worship).to be_invalid
      end
    end
    context '参拝日が明日以降のインスタンスを作成しようとしたとき' do
      it 'バリデーションにかかる' do
        worship = create(:worship)
        worship.worship_day = Date.today + 1
        expect(worship).to be_invalid
      end
    end
  end
end
