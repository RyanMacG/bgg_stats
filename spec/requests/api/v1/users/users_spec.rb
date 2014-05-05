require 'spec_helper'

describe "User API requests" do
  describe "GET /v1/users/:id" do
    it "returns a user by :id" do
      user = FactoryGirl.create(:user)

      get "/v1/users/#{user.id}"

      expect(response_json).to eq(
        {
          'name'  => user.name,
          'email' => user.email
        }
      )
    end
  end
end