Rails.application.routes.draw do

  # show all jobs
  get '/jobs' => 'jobs#index'

  # Create a job
  post '/jobs' => 'jobs#create'

  # Show one job
  get '/jobs/:id' => 'jobs#show'
end
