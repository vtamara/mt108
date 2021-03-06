# encoding: UTF-8

Rails.application.routes.draw do
  scope '/(:locale)', locale: /en|es/ do
    devise_scope :usuario do
      get 'sign_out' => 'devise/sessions#destroy'
    end
    devise_for :usuarios, :skip => [:registrations], module: :devise
    as :usuario do
      get 'usuarios/edit' => 'devise/registrations#edit', 
        :as => 'editar_registro_usuario'    
      put 'usuarios/:id' => 'devise/registrations#update', 
        :as => 'registro_usuario'            
    end
    resources :usuarios, path_names: { new: 'nuevo', edit: 'edita' }  

    resources :donaciones, path_names: { new: 'nueva', edit: 'edita' }

    resources :etapas, path_names: { new: 'nueva', edit: 'edita' }

    get '/:locale' => 'sip/hogar#index'
    root 'sip/hogar#index'
  end
  mount Sip::Engine, at: "/"
end
