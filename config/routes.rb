Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  post "/graphql", to: "graphql#execute"
  namespace :api do
    namespace :v1 do
      post '/submissions', to: 'submissions#create'
    end
  end
end
