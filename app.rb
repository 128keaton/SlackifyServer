require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/user'

before do
  content_type :json
end
 
get '/' do
	User.all.each do |user|
		JSON.generate(user.as_json)
	end
end

before do
  puts '[Params]'
  p params
end

post '/enable' do
	@user = User.new
	@user.uid = params[:user_id]
	begin
		if @user.save
			"{ 'success': true }".to_json
		else
			"{ 'success': false }".to_json
		end
	rescue ActiveRecord::RecordInvalid => e
		 "{ 'success': true }".to_json
	end
end
