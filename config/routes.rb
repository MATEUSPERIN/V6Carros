Rails.application.routes.draw do
  get "/clientes/busca" => "clientes#busca", as: :busca_cliente
  get "/inicial/busca" => "inicial#busca", as: :busca_veiculo
  get '/relatorio' => 'inicial#relatorio', as: :relatorio
  get '/veiculoEmprestado' => 'inicial#veiculoEmprestado', as: :veiculoEmprestado
  resources :motoristas
  resources :veiculos
  resources :locacaos
  resources :clientes
  devise_for :users
  get '/locacaos_export' => 'locacaos#export'
  get '/inicial_export' => 'inicial#export'
  root "inicial#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
