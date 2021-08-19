require 'rails_helper'

RSpec.describe "user_introductions/edit", type: :view do
  before(:each) do
    @user_introduction = assign(:user_introduction, UserIntroduction.create!())
  end

  it "renders the edit user_introduction form" do
    render

    assert_select "form[action=?][method=?]", user_introduction_path(@user_introduction), "post" do
    end
  end
end
