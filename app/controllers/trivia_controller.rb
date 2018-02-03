class TriviaController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

	def new
		@trivium=Trivium.new
	end

	def create
		@trivium=current_user.trivia.build(trivia_params)
		if @trivium.save
          redirect_to '/trivia/new'
        else
          render 'new'
        end

	end
    
    def ans_trivia
    	@trivia=Trivium.where.not(user_id: current_user.id)
        #@trivia=Trivium.all
    end

    def check_ans
    	my_answer=params[:temp][:answer]
    	actual_answer=params[:temp][:actual_answer]
    	if my_answer.casecmp(actual_answer)==0
    		flash[:check]="Congratulation!! Your answer is correct. You earned 4 points :)"
    	else
    		flash[:check]="Oops!! Your answer is wrong. The correct answer is "+actual_answer+". You loose 1 point :("
    	end
    	redirect_to '/answer'
    end

    def Highs

    end

    def show
    end

    private

    def trivia_params
      params.require(:trivium).permit(:question, :answer, :category)
    end

end
