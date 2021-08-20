require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'ユーザー登録' do
    context ""
      it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid  
      end
  end
end