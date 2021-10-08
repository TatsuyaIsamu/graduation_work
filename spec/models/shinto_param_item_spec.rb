require 'rails_helper'

RSpec.describe ShintoParamItem, type: :model do
  describe 'ShintoParamItem モデル' do
    it 'インスタンスを作成できる' do
      expect(FactoryBot.create(:shinto_param_item)).to be_valid
    end
  end
end
