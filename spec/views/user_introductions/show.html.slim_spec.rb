require 'rails_helper'

RSpec.describe "user_introductions/show", type: :view do
  before(:each) do
    @user_introduction = assign(:user_introduction, UserIntroduction.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
