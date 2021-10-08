require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryBot.create(:user)}
  let(:other) {FactoryBot.create(:other_user)}

  describe 'ユーザー登録' do
    it 'email、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(user).to be_valid  
    end
    it 'emailがないと登録できないこと' do
      user.email = nil
      expect(user).to be_invalid
    end
    it 'password がないと登録出来ないこと' do
      user.password = nil
      expect(user).to be_invalid
    end
  end

  describe 'フォロー機能' do
    context '違うユーザーをフォローしたとき' do
      it 'フォローができること' do
        expect{user.follow!(other)}.to change{user.active_relationships.find_by(followed_id: other.id)}.from(be_falsey).to(be_truthy)
      end
    end
    context 'フォローしているユーザーをフォローを解除したとき' do
      it 'フォローが解除できる' do
        user.follow!(other)
        expect{user.unfollow!(other)}.to change{user.active_relationships.find_by(followed_id: other.id)}.from(be_truthy).to(be_falsey)
      end
    end
    context "フォローしていないユーザーに対して following? メソッドをつかったとき" do
      it 'false が返ってくる' do
        user.follow!(other)
        user.unfollow!(other)
        expect(user.following?(other)).to be_falsey
      end
    end
  end

  describe 'ゲストログイン用メソッド' do
    it 'self.guest メソッドを使ったときゲストユーザーが返ってくる' do
      user = FactoryBot.create(:user, email: "guest@gmail.com", password: "aaaaaa", password_confirmation: "aaaaaa")
      expect(User.guest).to eq user
    end
  end

end
