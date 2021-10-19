RSpec.describe Comment, type: :system do
  describe '参拝へのコメント機能' do
    let(:user){create(:user)}
    let(:other){create(:other_user)}
    let(:shinto){create(:test_shinto)}
    let(:user_introduction){create(:user_introduction, user_id: user.id)}
    let(:other_user_introduction){create(:user_introduction, user_id: other.id)}
    let(:worship){create(:worship, user_id: user_introduction.user_id, shinto_id: shinto.id)}
    before do
      worship
      login(other_user_introduction.user)
    end
    describe 'コメントの入力機能' do
      context 'コメントを送信したとき' do
        it  'コメントが反映される' do
          visit worship_path(worship.id)
          fill_in "comment[comment]", with: "testcomment"
          click_on "送信する"
          expect(page).to have_content("testcomment")
        end
      end
      context 'コメントを空で送信したとき' do
        it  'バリデーションメッセージが出る' do
          visit worship_path(worship.id)
          fill_in "comment[comment]", with: ""
          click_on "送信する"
          expect(page).to have_content("コメントを入力して下さい")
        end
      end
      context 'コメントが6件以上送られたとき' do
        it  '最初の1件目は表示されなくなる' do
          visit worship_path(worship.id)
          6.times do |i|
            fill_in "comment[comment]", with: "message#{i}"
            sleep 0.5
            click_on "送信する"
          end
          sleep 3.0
          expect(page).not_to have_content("message0")
        end
      end
      context 'コメントが6件以上送られたとき' do
        it  '最初の1件目はリンクにアクセスすると表示される' do
          visit worship_path(worship.id)
          6.times do |i|
            fill_in "comment[comment]", with: "message#{i}"
            click_on "送信する"
          end
          sleep 0.5
          click_on "コメントを全て表示する"
          expect(page).to have_content("message0")
        end
      end
    end
    describe 'コメントの編集機能 削除機能' do
      let(:comment){create(:comment, worship_id: worship.id, user_id: other.id)}
      before do
        comment
        visit worship_path(worship.id)
      end
      context 'コメントを編集ボタンをおしたとき' do
        it  '編集中というメッセージが表示される' do
          find('.fa-ellipsis-h').click
          sleep 0.5
          expect(page).to have_content('コメントの編集中')
        end
      end
      context 'コメントを編集したとき' do
        it  '変更内容が反映される' do
          find('.fa-ellipsis-h').click
          sleep 1.0
          (page.all("textarea")[1]).set('変更しました')
          sleep 0.5
          click_on "更新する"
          sleep 0.5
          expect(page).to have_content('変更しました')
        end
      end
      context 'コメントが空白で更新しようとしたとき' do
        it  'バリデーションメッセージが表示される' do
          find('.fa-ellipsis-h').click
          sleep 1.0
          (page.all("textarea")[1]).set('')
          click_on "更新する"
          sleep 0.5
          expect(page).to have_content('コメントを記入して下さい')
        end
      end
      context 'コメントの削除ボタンを押したとき' do
        it  'コメントが削除される' do
          page.accept_confirm do
            find('.fa-trash').click
          end
          sleep 1.0
          expect(page).not_to have_content('testComment')
        end
      end
    end
    describe 'コメントの編集機能と削除機能のアクセス制限' do
      context 'コメントした人と違う人がその参拝画面にアクセスしたとき' do
        it  '編集ボタンと削除ボタンが表示されない' do
          create(:comment, worship_id: worship.id, user_id: other.id)
          visit home_path
          click_on find(".nav-item5").text
          user = create(:user, email: "test@test")
          login(create(:user_introduction, user_id: user.id).user)
          visit worship_path(worship.id)
          expect(page).to have_no_css('.fa-ellipsis-h')
          expect(page).to have_no_css('.fa-trash')
        end
      end
    end
  end
end