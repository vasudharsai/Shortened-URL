Rails.application.routes.draw do

  constraints format: :json do
   resources :urls
   get '/top', to: 'urls#top_urls'
  end

  get '/:shortened_url', to: 'urls#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
