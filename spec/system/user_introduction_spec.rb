RSpec.describe UserIntroduction, type: :system do
  describe "ユーザープロフィールの編集機能" do
    let(:user){create(:user)}
    before do
      user    
      user_login
    end
    context "ユーザーが住所を青森県に変更したとき" do
      it "変更できる" do
        

      end
    end
  end
end