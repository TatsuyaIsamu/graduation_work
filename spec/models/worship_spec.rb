require 'rails_helper'

RSpec.describe Worship, type: :model do
  describe '参拝機能' do
    it '参拝インスタンスを作成できる' do
      expect(FactoryBot.create(:worship)).to be_valid
    end
  end
end
