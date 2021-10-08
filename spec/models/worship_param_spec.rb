require 'rails_helper'

RSpec.describe WorshipParam, type: :model do
  describe 'WorshipParam モデル' do
    it 'WorshipParam モデルからインスタンスが作成できる' do
      expect(FactoryBot.create(:worship_param)).to be_valid
    end
  end
end
