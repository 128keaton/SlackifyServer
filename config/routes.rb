Rails.application.routes.draw do
	root 'base#index'
	post '/enable', to: 'base#enable' 
	post '/user', to: 'base#get_user'
end
