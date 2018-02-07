require 'spec_helper'

RSpec.describe "SignupPages", type: :request do
  describe "GET /signup_pages" do
  	#subject { page }

    describe "signup" do

    before { visit new_user_path }

    it { should have_content('FirstName') }
    

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "FirstName",    with: "Example User"
        fill_in "LastName",     with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
  end
end
