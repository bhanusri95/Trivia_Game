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
        @trivia=Trivium.all
    end

    def Highs

    end

    private

    def trivia_params
      params.require(:trivium).permit(:question, :answer, :category)
    end

end
