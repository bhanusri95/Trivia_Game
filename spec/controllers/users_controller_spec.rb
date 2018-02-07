require 'spec_helper'

describe UsersController do
  integrate_views

  describe "GET 'home'" do
    it "returns http success" do

      #get 'new'
      expect(response).to render_template(:new)
    end
  end

  

end
