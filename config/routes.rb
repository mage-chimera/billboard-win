Rails.application.routes.draw do
  #get 'artists/index'
  #get 'artists/show'
  resources :artists, only: [:index, :show]
  root 'songs#index' # 追加：ルートへのルーティングを追加
  #get 'songs/index'
  match '/songs',  to: 'songs#index', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
