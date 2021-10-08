require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe  'Comment モデル' do
    it  'Commentインスタンスが作成できる' do
      expect(FactoryBot.create(:comment)).to be_valid
    end
    context 'Commentを空で更新しようとしたとき' do
      it  'バリデーションで更新できない' do
        comment = FactoryBot.create(:comment)
        comment.comment = nil
        expect(comment).to be_invalid
      end
    end
  end

end
