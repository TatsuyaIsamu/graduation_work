require 'rails_helper'

RSpec.describe FavoriteWorship, type: :model do
  describe 'FavoriteWorshipモデル' do
    it 'インスタンスが作成できる' do
      binding.irb
      expect(FactoryBot.create(:favorite_worship)).to be_valid
    end
  end
end
