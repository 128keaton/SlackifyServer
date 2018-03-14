class BaseController < ApplicationController
	def index
		render :json => {
 			:users => User.all.each.as_json(:except => [:hex_code]),
		}
	end

	def enable
		if !User.find_by(slack_user_id: params[:user_id])
        		@user = User.new
        		@user.enabled = true
			@user.slack_user_id = params[:user_id]
                	if @user.save
                    		render json: @user.hex_code
                	end
		end
	end
end
