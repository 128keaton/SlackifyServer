class BaseController < ApplicationController
	def index
		render :json => {
 			:users => User.all.each.as_json(:except => [:hex_code]),
		}
	end
	
	def code
		if params[:code]
			puts params[:code]
			redirect_to 'keaton.slackify://slack?code=#{params[:code]}"
		end
	end

	def enable
		if !User.find_by(slack_user_id: params[:user_id])
        		@user = User.new
        		@user.enabled = true
			@user.slack_user_id = params[:user_id]
                	if @user.save
                    		render html: "<p>Save this code: <b>#{@user.hex_code}</b></p>".html_safe
                	end
		end
	end
	
	def get_user
		if @user = User.find_by(hex_code: params[:code])
			render json: @user.slack_user_id
		end
	end 
end
