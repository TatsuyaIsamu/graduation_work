require 'rails_helper'

RSpec.describe Shinto, type: :model do
  describe '神社の登録' do
    context '神社の登録をしたとき' do
      it '神社が登録できる' do
        shinto = FactoryBot.create(:shinto)
        binding.irb
        expect(shinto).to be_valid
      end
    end
  end
  
end
