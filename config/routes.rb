Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #resources :posts, only:[:index, :create]
  #resources :users, only:[:index, :create]
 namespace :posts do 
 	get '/:offset/:limit', to: 'posts#index'
 	post '/', to: 'posts#create'
 	get 'posts/find/:id', to: 'posts#find'
 	get 'posts/search/:nama', to: 'posts#search'
 	post 'comment', to: 'commentposts#create'
 	post 'lovepost', to: 'loveposts#create'
 end

 namespace :users do 
 	post '/', to: 'users#create'
 	get '/:offset/:limit', to: 'users#index'
 	get 'cek/fb/:id_fb', to: 'users#cek_daftar'

 end
 
 namespace	:checkpoints do
	 get '/', to: 'checkpoints#index'
 end


end
