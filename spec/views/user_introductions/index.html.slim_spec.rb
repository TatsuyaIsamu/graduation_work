require 'rails_helper'

RSpec.describe "user_introductions/index", type: :view do
  before(:each) do
    assign(:user_introductions, [
      UserIntroduction.create!(),
      UserIntroduction.create!()
    ])
  end

  it "renders a list of user_introductions" do
    render
  end
end
