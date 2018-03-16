Rails.application.routes.draw do
	root 'base#index'
	post '/enable', to: 'base#enable' 
	post '/user', to: 'base#get_user'
	get '/code', to: 'base#code'
  post '/shelter', to: 'base#shelter'
end
