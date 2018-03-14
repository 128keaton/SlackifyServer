Rails.application.routes.draw do
	root 'base#index'
	post '/enable', to: 'base#enable' 
end
