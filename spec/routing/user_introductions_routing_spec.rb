require "rails_helper"

RSpec.describe UserIntroductionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_introductions").to route_to("user_introductions#index")
    end

    it "routes to #new" do
      expect(get: "/user_introductions/new").to route_to("user_introductions#new")
    end

    it "routes to #show" do
      expect(get: "/user_introductions/1").to route_to("user_introductions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/user_introductions/1/edit").to route_to("user_introductions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user_introductions").to route_to("user_introductions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user_introductions/1").to route_to("user_introductions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user_introductions/1").to route_to("user_introductions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user_introductions/1").to route_to("user_introductions#destroy", id: "1")
    end
  end
end
