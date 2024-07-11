Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'index#dashboard', as: :authenticated_root
  end

  unauthenticated do
    root to: 'index#welcome', as: :unauthenticated_root
  end
end
