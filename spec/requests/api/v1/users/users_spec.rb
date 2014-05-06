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

  describe "POST /v1/users" do
    it "should create a user" do
      post '/v1/users', {
        name:                   'Foo bar',
        email:                  'bar@baz.com',
        password:               'foobar',
        password_confirmation:  'foobar'
      }.to_json, { 'Content-Type' => 'application/json' }

      user = User.last
      expect(response_json).to eq({ 'name' => user.name, 'email' => user.email })
    end

    it "returns an error when invalid" do
      post '/v1/users',
      {}.to_json,
      { 'Content-Type' => 'application/json' }

      expect(response_json).to eq({
        'message' => 'Validation Failed',
        'errors' => [
          "Name can't be blank",
          "Email can't be blank",
          "Email is invalid",
          "Password is too short (minimum is 6 characters)",
          "Password can't be blank",
        ]
      })
      expect(response.code.to_i).to eq 422
    end
  end
end