RSpec.describe Message, type: :system do
  describe 'メッセージ機能' do
    let(:user) { create(:user) }
    let(:other) { create(:other_user) }
    let(:user_introduction) { create(:user_introduction, user_id: user.id) }
    let(:other_user_introduction) { create(:user_introduction, user_id: other.id) }
    before do
      user_introduction
      other_user_introduction
      login(user)
    end
    describe 'メッセージの送信機能' do
      let(:conversation) { create(:conversation, sender_id: user.id, recipient_id: other.id) }
      context 'メッセージを送信したとき' do
        it 'メッセージが反映される' do
          visit conversation_messages_path(conversation.id)
          fill_in 'message[body]', with: 'testmessage'
          find('.message_submit').click
          expect(page).to have_content('testmessage')
        end
      end
      context '空でメッセージを送信したとき' do
        it 'メッセージが送信されない' do
          visit conversation_messages_path(conversation.id)
          fill_in 'message[body]', with: ''
          find('.message_submit').click
          sleep 0.5
          expect(page).to have_no_css('.messages')
        end
      end
      context 'メッセージが11件存在しているとき' do
        it '1件目のメッセージは表示されない' do
          visit conversation_messages_path(conversation.id)
          12.times do |n|
            fill_in 'message[body]', with: "#{n.to_s(16)}番目"
            sleep 0.5
            find('.message_submit').click
            sleep 0.5
          end
          expect(page).not_to have_content('0番目')
        end
      end
      context 'メッセージが11件あり、以前のメッセージをおしたとき' do
        it '1件目のメッセージが表示される' do
          visit conversation_messages_path(conversation.id)
          12.times do |n|
            fill_in 'message[body]', with: "#{n.to_s(16)}番目"
            sleep 0.5
            find('.message_submit').click
            sleep 0.5
          end
          click_on '以前のメッセージ'
          expect(page).to have_content('0番目')
        end
      end
    end
    describe '会話機能' do
      let(:conversation) { create(:conversation, sender_id: user.id, recipient_id: other.id) }
      let(:message) { create(:message, conversation_id: conversation.id, user_id: user.id) }
      before do
        message
        click_on find('.nav-item5').text
        login(other)
      end
      context '履歴のある会話内容をひらいたとき' do
        it '以前の会話が表示される' do
          visit conversation_messages_path(conversation.id)
          expect(page).to have_content('testBody')
        end
      end
      context '履歴のある会話内容をひらいてメッセージを送信したとき' do
        it '相手の名前と自分の名前のトーク履歴がのこる' do
          visit conversation_messages_path(conversation.id)
          fill_in 'message[body]', with: 'testmessage'
          find('.message_submit').click
          expect(page).to have_content('testuser')
          expect(page).to have_content('otheruser')
        end
      end
    end
  end
end
