require 'rails_helper'

RSpec.describe Ranking, type: :model do
  describe  'Rankingモデル' do
    it  'Rankingインスタンスが作成できる' do
      expect(FactoryBot.create(:ranking)).to be_valid
    end
  end
end
