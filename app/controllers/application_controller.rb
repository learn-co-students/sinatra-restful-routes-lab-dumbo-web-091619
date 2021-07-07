class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  # code actions here!
  get '/recipes/new' do
    # binding.pry
    erb :new #show new recipes view
  end

  get '/recipes' do
    @recipes = Recipe.all
    # binding.pry
    erb :index #show all recipes view (index)
  end


  post '/recipes' do
    # binding.pry
    @recipe = Recipe.create(params) #create new recipe
    redirect to "/recipes/#{@recipe.id}"  
  end


  get '/recipes/:id' do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #loads edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do #destroy action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
