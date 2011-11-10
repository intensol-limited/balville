::Refinery::Application.routes.draw do
  resources :newsblogs, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :newsblogs, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
