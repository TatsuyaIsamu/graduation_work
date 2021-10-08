require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) {FactoryBot.create(:message)}
  describe 'Message モデル' do
    it  ' インスタンスが作成できる' do
      expect(message).to be_valid
    end
    context 'bodyが空のとき' do
      it  'バリデーションに引っかかる' do
        message.body = nil
        expect(message).to be_invalid
      end
    end
  end
end
