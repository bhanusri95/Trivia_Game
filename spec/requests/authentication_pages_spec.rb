require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit '/signin' }

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.email) }
      it { should have_content('Create Trivia') }
      it { should have_content('Answer Trivia') }
      it { should have_content('High scores') }
      it { should have_content('My score card') }
    end
  end
end