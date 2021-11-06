RSpec.describe Contact, type: :model do
  describe 'Contact モデル' do
    context 'インスタンスを作成したとき' do
      it 'インスタンスが作成できる' do
        contact = create(:contact)
        expect(contact.name).to eq 'MyString'
        expect(contact.email).to eq 'test@gmail.com'
        expect(contact.content).to eq 'MyText'
      end
    end
    context 'email が空のとき' do
      it 'バリデーションに引っかかる' do
        expect(Contact.new(email: '')).to be_invalid
      end
    end
    context 'email にアドレス以外が入力されたとき' do
      it 'バリデーションに引っかかる' do
        expect(Contact.new(email: 'test')).to be_invalid
      end
    end
    context 'title が空のとき' do
      it 'バリデーションに引っかかる' do
        expect(Contact.new(name: '')).to be_invalid
      end
    end
    context 'content が空のとき' do
      it 'バリデーションに引っかかる' do
        expect(Contact.new(content: '')).to be_invalid
      end
    end
  end
end
