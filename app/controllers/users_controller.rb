class UsersController < ApplicationController
  def home
  end

  def index
  	#@user=User.new
  end

  def new
  	@user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      #redirect_to :action => "home"
      redirect_to :controller=> "sessions", :action => "new"
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:FirstName, :MiddleName, :LastName,:email, :password,
                                   :password_confirmation)
    end

  def show
  	
  end
end
