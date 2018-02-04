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
    	id=params[:temp][:id]
    	tags=Trivium.find_by_id(id).tags
    	tags.each do |tag|
    		score=Score.find_by(user_id: current_user.id, tag_id: tag.id)
    		if score.nil?
    			Score.create(user_id: current_user.id, tag_id: tag.id, points: 0)
    		end
    	end
    	if my_answer.casecmp(actual_answer)==0
    		tags.each do |tag|
    		    scoretemp=Score.find_by(user_id: current_user.id, tag_id: tag.id)
                scoretemp.points+=4
                scoretemp.save
    		end
    		flash[:check]="Congratulations!! Your answer is correct. You earned 4 points :)"
    	else
    		tags.each do |tag|
    		    scoretemp=Score.find_by(user_id: current_user.id, tag_id: tag.id)
                scoretemp.points-=1
                scoretemp.save
    		end
    		flash[:check]="Oops!! Your answer is wrong. The correct answer is "+actual_answer+". You loose 1 point :("
    	end
    	#triv=Tagging.where(trivium: id)
    	#tags_ids=[]
    	#triv.each do |t|
    	#	tags_ids.push(t.tag.id)
    	#end

    	redirect_to '/answer'
    	
    end

    def Highs

    end

    def show
    	@score=Score.where(user: current_user.id)

    end

    private

    def trivia_params
      params.require(:trivium).permit(:question, :answer, :tag_list)
    end

end
