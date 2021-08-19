require 'rails_helper'

RSpec.describe "user_introductions/new", type: :view do
  before(:each) do
    assign(:user_introduction, UserIntroduction.new())
  end

  it "renders new user_introduction form" do
    render

    assert_select "form[action=?][method=?]", user_introductions_path, "post" do
    end
  end
end
