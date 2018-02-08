require 'spec_helper'

describe Trivium do
    let(:user) { FactoryGirl.create(:user) }
  
    before do
    	@trivium = Trivium.new(question: "what is your name", answer: "Bhanu",tag_list: "GK",user_id: user.id)
    end
    #@trivium = Trivium.new(question: "what is your name", answer: "Bhanu",tag_list: "GK",user_id: user.id)
  

    subject { @trivium }

    it { should respond_to(:question) }
    it { should respond_to(:answer) }
    it { should respond_to(:tag_list) }
    it { should respond_to(:user_id) }
    #its(:user) { should eq user }

    it { should be_valid }

    describe "when user_id is not present" do
      before { @trivium.user_id = nil }
      it { should_not be_valid }
    end

end
