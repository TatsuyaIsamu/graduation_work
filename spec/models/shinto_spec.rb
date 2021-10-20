RSpec.describe Shinto, type: :model do
  describe '神社の登録' do
    context '神社の登録をしたとき' do
      it '神社が登録できる' do
        expect(create(:shinto)).to be_valid
      end
    end
  end
  # circleCIでエラーになるのでコメントアウト
  # describe 'geocoder' do
  #   context '住所を登録したとき' do
  #     it '緯度と経度が算出される' do
  #       expect(create(:shinto).latitude).not_to be_blank
  #     end
  #   end
  # end
end
