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

    def by_category
        @tags=Tag.all
    end
    
    def ans_trivia
        if params[:id]=="all"
            @trivia=Trivium.find_with_reputation(:votes, :all, order: "votes desc").where.not(user_id: current_user.id)
        else
            @trivia=Tag.find_by_id(params[:id]).trivia.where.not(user_id: current_user.id).find_with_reputation(:votes, :all, order: "votes desc")
        end
        @tag_id=params[:id]
    	#@trivia=Trivium.find_with_reputation(:votes, :all, order: "votes desc").where.not(user_id: current_user.id)
        #@torder=@trivia.find_with_reputation(:votes, :all, order: "votes desc")
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
            #@check="Congratulations!! Your answer is correct. You earned 4 points :)"
    		flash[:check]="Congratulations!! Your answer is correct. You earned 4 points :)"
            flash[:pos]=true
    	else
    		tags.each do |tag|
    		    scoretemp=Score.find_by(user_id: current_user.id, tag_id: tag.id)
                scoretemp.points-=1
                scoretemp.save
    		end
    		flash[:check]="Oops!! Your answer is wrong. The correct answer is "+actual_answer+". You loose 1 point :("
            flash[:pos]=false
    	end
        respond_to do |format|
            format.html { 
                redirect_to :action=> "ans_trivia", :id=>params[:temp][:tag_id] 
            }
        end
    	#triv=Tagging.where(trivium: id)
    	#tags_ids=[]
    	#triv.each do |t|
    	#	tags_ids.push(t.tag.id)
    	#end
        #redirect_to :action=> "ans_trivia", :id=>params[:temp][:tag_id]
    	
    end

    def vote
        value = params[:type] == "up" ? 1 : -1
        @trivium = Trivium.find(params[:id])
        @trivium.add_or_update_evaluation(:votes, value, current_user)
        flash[:notice]="Thank you for voting"
        respond_to do |format|
            format.html{redirect_to :action=> "ans_trivia", :id=>params[:tag_id]}
        end 
        #redirect_to :back, notice: "Thank you for voting"

    end

    def Highs
        @order=Score.group(:user_id).select('user_id, SUM(points) as total').order('total desc').limit(10)
    end

    def show
    	@score=Score.where(user: current_user.id)
    	@total_score=@score.sum(:points)
    end

    private

    def trivia_params
      params.require(:trivium).permit(:question, :answer, :tag_list)
    end



end
