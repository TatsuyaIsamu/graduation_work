RSpec.describe Contact, type: :model do
  describe "Contact モデル" do
    context "インスタンスを作成したとき" do
      it "インスタンスが作成できる" do
        contact = create(:contact)
        expect(contact.name).to eq 'MyString'
        expect(contact.email).to eq 'MyString'
        expect(contact.content).to eq 'MyText'
      end  
    end
    context "email が空のとき" do
      it 'バリデーションに引っかかる' do
        expect(Contact.new(email: "")).to be_invalid
      end
    end
  end
end

# name { "MyString" }
# email { "MyString" }
# content { "MyText" }