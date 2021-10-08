require 'rails_helper'

RSpec.describe UserIntroduction, type: :model do
  describe 'UserIntroduction を作成したとき' do
    it 'インスタンスが作成できる' do
      user = FactoryBot.create(:user_introduction)
      expect(user).to be_valid
    end
  end
end
