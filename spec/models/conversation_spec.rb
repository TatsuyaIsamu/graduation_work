RSpec.describe Conversation, type: :model do
  let(:conversation) {create(:conversation)}
  describe  'Conversation モデル' do
    it  'インスタンスが作成できる' do
      expect(create(:conversation)).to be_valid
    end
    context 'sender_id と recipient_id が２つ以上作られようとすると' do
      it  'バリデーションエラーになる' do
        conversation
        invalid_conversation = Conversation.new(sender_id: conversation.sender.id, recipient_id: conversation.recipient.id)
        expect(invalid_conversation).to be_invalid
      end
    end
    let(:user) {create(:user)}
    let(:other_user) {create(:other_user)}
    describe  'between メソッド' do
      context 'sender_id recipient_id の順番で user と other_user が格納されていたとき' do
        it 'conversation インスタンスを取り出せる' do
          Conversation.create(sender_id: user.id, recipient_id: other_user.id)
          expect(Conversation.between(user.id, other_user.id)).not_to be_blank
        end
      end
      context 'recipient_id sender_id の順番で user と other_user が格納されていたとき' do
        it 'conversation インスタンスが取り出せる' do
          Conversation.create(recipient_id: user.id, sender_id: other_user.id)
          expect(Conversation.between(user.id, other_user.id)).not_to be_blank
        end
      end
    end
    describe 'target_user メソッド' do
      context '引数に渡した値が sender のとき' do
        it 'recipient_id のユーザーを返す' do
          expect(conversation.target_user(conversation.sender)).to eq conversation.recipient
        end
      end
      context '引数に渡した値が recipient のとき' do
        it 'sender_id のユーザーを返す' do
          expect(conversation.target_user(conversation.recipient)).to eq conversation.sender
        end
      end
    end
  end
end

