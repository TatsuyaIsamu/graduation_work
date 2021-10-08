require 'rails_helper'

RSpec.describe RankingItem, type: :model do
  describe  'RankingItemモデル' do
    it  'RankingItem インスタンスが作成できる' do
      expect(FactoryBot.create(:ranking_item)).to be_valid
    end
  end
end
