require 'rails_helper'

RSpec.describe Worship, type: :model do
  describe '参拝機能' do
    it '参拝インスタンスを作成できる' do
      expect(FactoryBot.create(:worship)).to be_valid
    end
    context '参拝日が空のインスタンスを作成しようとしたとき' do
      it 'バリデーションにかかる' do
        worship = FactoryBot.create(:worship)
        worship.worship_day = nil
        expect(worship).to be_invalid
      end
    end
  end
end
